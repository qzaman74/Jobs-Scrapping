import bs4 as bs
import requests
import mysql.connector
import threading
from nltk import word_tokenize, pos_tag, ne_chunk,conlltags2tree, tree2conlltags
import socket


def main():
    
    try:
        count = 0
        mydb = mysql.connector.connect(
          host="localhost",
          user="root",
          passwd="qamar123",
          database="scrapping_db"
        )
        cursor = mydb.cursor()
        qry = "SELECT max(job_id) FROM jobs_log"
        cursor.execute(qry)
        max_id = cursor.fetchall()[0][0]
        if(max_id==None):
            max_id = 0

        print("Searching for new jobs...")
        web = requests.get("https://news.ycombinator.com/jobs")
        c = web.content
        soup = bs.BeautifulSoup(c,features="html.parser")

        
        ##extracting job IDs
        for post in soup.findAll("tr",class_="athing"):
            #for anchor in post.findAll("a",class_="storylink"):
            
            job_id = post.get("id")
            print(f"jobId:{job_id}, maxId:{max_id}")
            if(int(job_id)<=int(max_id)):
                break
            else:
                anchor = post.find("a",class_="storylink")   
                ##extracting company names
                story = anchor.text.split(">")[0]

                company = story.split(" (")
                if(len(company)==1):
                    company = story.lower().split(" is ")
                    company = company[0]
                else:
                    company = company[0]
                
                ##extracting positions and locations
               
                position = story.lower().split(" hiring ") #try spliting on 'hiring'
                if(len(position)==1):#cannot split on 'hiring'
                    position = story.lower().split(" looking for ")#try spliting on ' looking for '
                    if(len(position)==1):#cannot splilt on 'looking for'
                        try:
                            position = story.lower().split(" seeking ")[1]#try spliting on ' seeking'
                        except IndexError:
                            position = 'Not Mentioned'
                    else:
                        position = position[1]
                    
                else:
                    position = position[1]
                    
                lst = position.split(" in ") #avoiding locations
                if(len(lst)!=1):
                    position = lst[0]
                    

                '''    this code was written to get locations using split method without any NLP lib

                lst = position.split(" in ") #extracting locations
                if(len(lst)!=1):
                    location = lst[1]
                  '''

                ''' This piece of code calls the get_locations function which returns a list of locations
                    extracted from job description using NLTK. Next 2 if-else statements avoids the scenerio
                    where NLTK extracts company as location due to lack of training'''
                
                location = get_locations(story)
                if(len(location)>0): #the get_locations function returned some location
                    location = location[-1] #considering last entity as authentic because location is found at the end of sentence
                else:
                    location = "N/A"
                if(location.strip().lower()==company.strip().lower()):
                    location = "N/A"
                
                #Inserting new found job to database
                qry = f"INSERT INTO jobs_log VALUES({job_id},'{position}','{company}','{location}',unix_timestamp())"
                cursor.execute(qry)
                mydb.commit()
                count+=1

           
        print(f"{count} new job(s) found !")
        timer = threading.Timer(2.0, main) #Timer currenlty set to 2 seconds
        timer.start()
    
    except :
        print("An Error Occoured, Please Check Your Internet connection/Invalid Data Found From the URL")
    
def get_locations(description):
    
    tree = (ne_chunk(pos_tag(word_tokenize(description))))
    iob = tree2conlltags(tree)
    locations_list = []
    for chunk in iob:
        if(chunk[2] in ['B-GPE','I-GPE']):
            locations_list.append(chunk[0])
    return locations_list
    


main()
