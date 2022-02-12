-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2019 at 07:28 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scrapping_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `jobs_log`
--

CREATE TABLE `jobs_log` (
  `job_id` int(11) NOT NULL,
  `position` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_on` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs_log`
--

INSERT INTO `jobs_log` (`job_id`, `position`, `company_name`, `location`, `created_on`) VALUES
(20387948, 'a technical lead', 'Asseta', 'N/A', 1563658558),
(20388963, 'a lead engineer – help save gig workers money on taxes', 'Keeper', 'N/A', 1563658558),
(20403339, '– help us make apis easy to use', 'ReadMe', 'N/A', 1563658558),
(20407783, 'an engineering manager', 'Fond', 'Portland', 1563658558),
(20409379, 'android and ios developers to build our native mobile app', 'gusto', 'N/A', 1563658558),
(20411607, 'software engineers', 'Demodesk', 'Munich', 1563658558),
(20416428, 'a senior systems/cloud engineer', 'Atomwise', 'N/A', 1563658558),
(20417429, 'an sre to scale our bare-metal infrastructure', 'onesignal', 'N/A', 1563658557),
(20419287, 'an ml engineer to help train our machines to deliver better video', 'mux', 'N/A', 1563658557),
(20422053, 'software engineers – devops monitoring at scale', 'LogDNA', 'N/A', 1563658557),
(20431145, 'an account executive for b2b flying vehicle software', 'iris automation', 'Iris', 1563658557),
(20440815, 'a product designer who cares about education', 'GiveCampus', 'N/A', 1563658557),
(20443429, 'product and ml engineers (remote ok, no prior ml ok)', 'Sourceress', 'N/A', 1563658557),
(20446895, 'a director of ops and growth', 'Jerry', 'Growth', 1563658557),
(20448534, 'our first u.s. strategic account executive', 'Saleswhale', 'U.S.', 1563658557),
(20450985, 'an engineering manager, ecosystem', 'Gitlab', 'N/A', 1563658557),
(20452997, 'a software engineer', 'Tech Nonprofit Upsolve', 'N/A', 1563658557),
(20454597, 'engineers to automate compliance for architects', 'UpCodes', 'N/A', 1563658556),
(20455773, 'a director of engineer', 'ZeroCater', 'Engineer', 1563658556),
(20456754, 'in vancouver', 'Streak – CRM for Gmail', 'Vancouver', 1563658556),
(20457696, 'a video solutions architect/software engineer', 'Bitmovin', 'Brazil', 1563658556),
(20461615, '– help us un-break construction', 'BuildZoom', 'N/A', 1563658556),
(20463814, 'game developers', 'Mino Games', 'Montreal', 1563658556),
(20467871, 'engineers to accelerate the development of ai', 'scale ai', 'N/A', 1563658556),
(20470975, 'a hr people and culture manager', 'AptDeco', 'N/A', 1563658556),
(20473165, 'an engineer to lead development on a new fuzzing engine', 'Fuzzbuzz', 'N/A', 1563658556),
(20476330, 'a senior data engineer', 'The Muse', 'N/A', 1563658555),
(20478319, 'software engineers', 'flexport', 'Chicago', 1563658555),
(20482703, 'a mobile sdk engineer – help us kill analytics.track()', 'heap', 'N/A', 1563658555),
(20483584, 'early engineers and teachers', 'Flockjay', 'N/A', 1563658555);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jobs_log`
--
ALTER TABLE `jobs_log`
  ADD PRIMARY KEY (`job_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
