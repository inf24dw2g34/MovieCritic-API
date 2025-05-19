-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: moviecritic
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Dr. Alfonso Baumbach','2025-05-19 13:45:47','2025-05-19 13:45:47'),(2,'Shelley Nolan','2025-05-19 13:45:47','2025-05-19 13:45:47'),(3,'Sharon Hilll','2025-05-19 13:45:47','2025-05-19 13:45:47'),(4,'Mr. Edmund Sawayn','2025-05-19 13:45:47','2025-05-19 13:45:47'),(5,'Antonia Mayer MD','2025-05-19 13:45:47','2025-05-19 13:45:47'),(6,'Joanna Leannon','2025-05-19 13:45:47','2025-05-19 13:45:47'),(7,'Veronica Hackett','2025-05-19 13:45:47','2025-05-19 13:45:47'),(8,'Luke Larkin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(9,'Virginia Beier','2025-05-19 13:45:47','2025-05-19 13:45:47'),(10,'Pam Abbott DVM','2025-05-19 13:45:47','2025-05-19 13:45:47'),(11,'Grady Borer','2025-05-19 13:45:47','2025-05-19 13:45:47'),(12,'Elena Kohler IV','2025-05-19 13:45:47','2025-05-19 13:45:47'),(13,'Luis Pfeffer','2025-05-19 13:45:47','2025-05-19 13:45:47'),(14,'Miss Alicia Renner','2025-05-19 13:45:47','2025-05-19 13:45:47'),(15,'Mrs. Kristina Heaney','2025-05-19 13:45:47','2025-05-19 13:45:47'),(16,'Mr. Damon Harber Jr.','2025-05-19 13:45:47','2025-05-19 13:45:47'),(17,'Molly Skiles','2025-05-19 13:45:47','2025-05-19 13:45:47'),(18,'Dr. Franklin Mann','2025-05-19 13:45:47','2025-05-19 13:45:47'),(19,'Tasha Okuneva','2025-05-19 13:45:47','2025-05-19 13:45:47'),(20,'Nicolas Hirthe DDS','2025-05-19 13:45:47','2025-05-19 13:45:47'),(21,'Mr. Marshall Roob DVM','2025-05-19 13:45:47','2025-05-19 13:45:47'),(22,'Shirley Runolfsson','2025-05-19 13:45:47','2025-05-19 13:45:47'),(23,'Clifton Johnson','2025-05-19 13:45:47','2025-05-19 13:45:47'),(24,'Molly Franey','2025-05-19 13:45:47','2025-05-19 13:45:47'),(25,'Mr. Scott Mayer','2025-05-19 13:45:47','2025-05-19 13:45:47'),(26,'Ms. Traci Larson','2025-05-19 13:45:47','2025-05-19 13:45:47'),(27,'Christine Muller','2025-05-19 13:45:47','2025-05-19 13:45:47'),(28,'Yvonne Klein','2025-05-19 13:45:47','2025-05-19 13:45:47'),(29,'Karl Bartoletti','2025-05-19 13:45:47','2025-05-19 13:45:47'),(30,'Amelia Weber','2025-05-19 13:45:47','2025-05-19 13:45:47');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int NOT NULL,
  `movieId` int NOT NULL,
  PRIMARY KEY (`userId`,`movieId`),
  KEY `movieId` (`movieId`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('2025-05-19 13:45:47','2025-05-19 13:45:47',3,16),('2025-05-19 13:45:47','2025-05-19 13:45:47',3,23),('2025-05-19 13:45:47','2025-05-19 13:45:47',3,37),('2025-05-19 13:45:47','2025-05-19 13:45:47',4,7),('2025-05-19 13:45:47','2025-05-19 13:45:47',5,21),('2025-05-19 13:45:47','2025-05-19 13:45:47',6,13),('2025-05-19 13:45:47','2025-05-19 13:45:47',6,44),('2025-05-19 13:45:47','2025-05-19 13:45:47',7,1),('2025-05-19 13:45:47','2025-05-19 13:45:47',7,6),('2025-05-19 13:45:47','2025-05-19 13:45:47',8,26),('2025-05-19 13:45:47','2025-05-19 13:45:47',8,42),('2025-05-19 13:45:47','2025-05-19 13:45:47',9,43),('2025-05-19 13:45:47','2025-05-19 13:45:47',11,5),('2025-05-19 13:45:47','2025-05-19 13:45:47',11,34),('2025-05-19 13:45:47','2025-05-19 13:45:47',11,50),('2025-05-19 13:45:47','2025-05-19 13:45:47',12,20),('2025-05-19 13:45:47','2025-05-19 13:45:47',12,24),('2025-05-19 13:45:47','2025-05-19 13:45:47',12,50),('2025-05-19 13:45:47','2025-05-19 13:45:47',13,23),('2025-05-19 13:45:47','2025-05-19 13:45:47',13,25),('2025-05-19 13:45:47','2025-05-19 13:45:47',14,18),('2025-05-19 13:45:47','2025-05-19 13:45:47',16,33),('2025-05-19 13:45:47','2025-05-19 13:45:47',16,37),('2025-05-19 13:45:47','2025-05-19 13:45:47',17,6),('2025-05-19 13:45:47','2025-05-19 13:45:47',17,23),('2025-05-19 13:45:47','2025-05-19 13:45:47',18,47),('2025-05-19 13:45:47','2025-05-19 13:45:47',19,15),('2025-05-19 13:45:47','2025-05-19 13:45:47',21,27),('2025-05-19 13:45:47','2025-05-19 13:45:47',21,28),('2025-05-19 13:45:47','2025-05-19 13:45:47',21,35),('2025-05-19 13:45:47','2025-05-19 13:45:47',21,37),('2025-05-19 13:45:47','2025-05-19 13:45:47',21,40),('2025-05-19 13:45:47','2025-05-19 13:45:47',23,21),('2025-05-19 13:45:47','2025-05-19 13:45:47',24,14),('2025-05-19 13:45:47','2025-05-19 13:45:47',24,19),('2025-05-19 13:45:47','2025-05-19 13:45:47',24,46),('2025-05-19 13:45:47','2025-05-19 13:45:47',24,50),('2025-05-19 13:45:47','2025-05-19 13:45:47',25,27),('2025-05-19 13:45:47','2025-05-19 13:45:47',26,21),('2025-05-19 13:45:47','2025-05-19 13:45:47',27,17),('2025-05-19 13:45:47','2025-05-19 13:45:47',27,43),('2025-05-19 13:45:47','2025-05-19 13:45:47',28,30),('2025-05-19 13:45:47','2025-05-19 13:45:47',28,49),('2025-05-19 13:45:47','2025-05-19 13:45:47',29,21),('2025-05-19 13:45:47','2025-05-19 13:45:47',29,28),('2025-05-19 13:45:47','2025-05-19 13:45:47',30,1),('2025-05-19 13:45:47','2025-05-19 13:45:47',30,41),('2025-05-19 13:45:47','2025-05-19 13:45:47',30,45),('2025-05-19 13:54:03','2025-05-19 13:54:03',31,2),('2025-05-19 13:54:08','2025-05-19 13:54:08',31,17),('2025-05-19 13:57:58','2025-05-19 13:57:58',32,15);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year` int NOT NULL,
  `duration` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `directorId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `directorId` (`directorId`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`directorId`) REFERENCES `directors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'defendant in the Time of goodwill','Volaticus cometes canto amicitia admoveo blanditiis curis decimus distinctio. Verto carmen deleo coerceo sub arguo timidus vulgaris. Ipsa tenuis theologus crudelis autus nulla ascisco thorax atque.',1948,140,'2025-05-19 13:45:47','2025-05-19 13:45:47',12),(2,'Return of the rosemary','Texo currus vaco decet tener pel vitiosus ascisco itaque carmen. Sponte depopulo confugo argumentum crinis tenus delibero. Ad tardus ad adversus tempus pecco ullus non calamitas.',1938,64,'2025-05-19 13:45:47','2025-05-19 13:45:47',8),(3,'When Corene Met Corbin','Vilicus strues deporto acquiro non usitas approbo amplus arguo thymbra. Angelus balbus cuius bene peccatus textus verumtamen cogo. Communis textor pariatur vero comes coniuratio sublime.',1994,123,'2025-05-19 13:45:47','2025-05-19 13:45:47',30),(4,'Finding Cordell','Coruscus arma adeptio textor una uterque curo aggero. Viscus ipsam cursus. Dedecor tertius conitor fugit.',1991,163,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(5,'The Curse of the mozzarella','Vesica adsum solium aestas supplanto amor tabgo tepesco facere deporto. Coepi stabilis speculum. Ultra trepide coruscus.',1968,224,'2025-05-19 13:45:47','2025-05-19 13:45:47',13),(6,'When Jackeline Met Esther','Similique canto vereor culpo amo adfectus. Sed caterva clarus suppellex caries comptus apud suppono attonbitus. Volup quam tristis statua trans altus deputo coniuratio.',1985,91,'2025-05-19 13:45:47','2025-05-19 13:45:47',1),(7,'Beyond the dulcimer','Decipio molestias repellat contabesco talio bestia sono. Defungo traho adeo. Non porro vester.',1968,175,'2025-05-19 13:45:47','2025-05-19 13:45:47',1),(8,'Escape from Mervinland','Demergo autus aqua. Magnam cohaero tabgo decerno acies appositus vita conduco. Tondeo pecto amoveo harum cernuus vilitas vinum officia quod.',1941,218,'2025-05-19 13:45:47','2025-05-19 13:45:47',23),(9,'My Life as a ruin','Caelum validus optio arbustum sapiente verbera. Ater speculum terga amita asperiores suscipit supplanto conforto. Cariosus demulceo absens antea volubilis paens sto illum summopere avaritia.',1929,79,'2025-05-19 13:45:47','2025-05-19 13:45:47',16),(10,'The Last costume','Tot calco validus. Decerno ventosus thymbra suffoco. Vesica arceo angelus delibero vulariter vulgo bellum textilis victus eum.',2021,186,'2025-05-19 13:45:47','2025-05-19 13:45:47',20),(11,'scuffle and stint','Vindico error aiunt quibusdam tracto. Talis tricesimus tabernus quod. Stella deleniti vergo vitae angelus terror bene acies comptus tristis.',1966,66,'2025-05-19 13:45:47','2025-05-19 13:45:47',9),(12,'Finding Delmer','Admitto textilis teneo aegre depulso possimus sapiente vita patior. Tamdiu vado thesaurus. Cotidie coniecto vox umquam vulariter.',2007,228,'2025-05-19 13:45:47','2025-05-19 13:45:47',19),(13,'Legend of the critical commodity','Solio dedecor utrimque. Tepidus abutor error corpus doloribus caritas officiis. Quaerat fugit denuo bellum.',1976,209,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(14,'Beyond the restaurant','Cicuta comminor adimpleo amplitudo cena coadunatio dignissimos utrimque constans. Denuncio textus vulariter caritas decumbo patruus delego communis. Tibi suggero ad depopulo ara solio succurro.',1926,223,'2025-05-19 13:45:47','2025-05-19 13:45:47',23),(15,'Return of the space','Basium minima versus paens magni spargo casus. Cura architecto culpo natus cavus crudelis valens. Tui textus universe argumentum substantia attero deorsum curriculum.',1967,110,'2025-05-19 13:45:47','2025-05-19 13:45:47',5),(16,'Moses\'s knickers','Curo verumtamen dolorem pariatur eveniet deprimo. Patria fuga valens sophismata ago texo conventus. Tracto conturbo assumenda vesica animi.',1967,230,'2025-05-19 13:45:47','2025-05-19 13:45:47',1),(17,'mobilize and avow','Barba cedo arbitro verto abstergo reprehenderit coadunatio deinde desipio. Tenus uberrime cibo calculus corrupti admoveo creta. Taceo delectatio pecto.',2004,235,'2025-05-19 13:45:47','2025-05-19 13:45:47',7),(18,'When Jeff Met Edd','Subnecto quia annus ustilo volva victoria amissio titulus supellex asper. Culpa beatus adhaero despecto agnitio viriliter. Arbitro dens admitto.',1964,136,'2025-05-19 13:45:47','2025-05-19 13:45:47',19),(19,'Beyond the reconsideration','Suspendo contabesco consectetur arma virga. Quibusdam aut vespillo curvo canonicus. Nobis attonbitus vacuus abscido libero paulatim.',1982,74,'2025-05-19 13:45:47','2025-05-19 13:45:47',21),(20,'Legend of the mindless bob','Vir autem tutis velit. Coniuratio sophismata abbas vita. Benevolentia delibero venustas demergo tenax venustas.',1925,214,'2025-05-19 13:45:47','2025-05-19 13:45:47',23),(21,'Legend of the nutritious flight','Antepono soleo vitiosus voluptas adulatio atrocitas velit libero. Culpo amita quaerat. Vigor eaque tametsi cicuta thesaurus atque calcar autem verbera.',1955,88,'2025-05-19 13:45:47','2025-05-19 13:45:47',10),(22,'The Curse of the cornet','Asper somnus cunctatio. Stipes vobis eligendi. Socius denique cupiditate carcer cruentus illo cernuus vulnero aegrotatio deserunt.',1997,240,'2025-05-19 13:45:47','2025-05-19 13:45:47',2),(23,'Nightfall in Ullrichstead','Cohors antiquus vinitor corona confero. Ver tredecim valde denuo aqua solvo. Urbs voluptatum usus audentia teres vitium.',1981,237,'2025-05-19 13:45:47','2025-05-19 13:45:47',13),(24,'The pasta That Could','Pel vivo absum appono adhuc. Cunabula claudeo advoco. Ullus saepe tabernus caritas crinis ut color.',1990,127,'2025-05-19 13:45:47','2025-05-19 13:45:47',1),(25,'Olen\'s apricot','Coruscus beneficium compono. Cibo totus tersus acceptus. Cultellus thymbra soleo beatus vereor officiis teres.',1964,61,'2025-05-19 13:45:47','2025-05-19 13:45:47',17),(26,'hard-to-find Dreams','Officiis congregatio aegrus. Tantum comprehendo ut temperantia comis usque talio. Aegrotatio valde canonicus viridis adsidue concido.',2003,109,'2025-05-19 13:45:47','2025-05-19 13:45:47',20),(27,'those resolve Rising','Demum doloremque cunctatio eaque derideo studio derelinquo tollo. Consequatur cado vesper claustrum charisma patruus. Approbo sum deputo carcer pecto.',1958,70,'2025-05-19 13:45:47','2025-05-19 13:45:47',16),(28,'The effector Code','Succedo suspendo denuncio atrocitas expedita decerno aranea. Crepusculum desino cognatus uxor coaegresco suscipit est candidus. Minus circumvenio sui uredo deripio coaegresco.',1983,175,'2025-05-19 13:45:47','2025-05-19 13:45:47',17),(29,'The platter Code','Verumtamen subvenio communis attero vulariter despecto aufero. Cauda tyrannus uredo desolo dolore modi crinis. Ulciscor cariosus villa denique porro.',1991,186,'2025-05-19 13:45:47','2025-05-19 13:45:47',21),(30,'Micah\'s palate','Deinde cribro calco. Debitis cognomen delectus. Spectaculum arcus abutor delectatio stillicidium attonbitus absens vos xiphias arbor.',1921,122,'2025-05-19 13:45:47','2025-05-19 13:45:47',28),(31,'When Molly Met Malachi','Vesica tendo virga rem tunc adeo defessus denuo nostrum. Enim amplexus voluptas beatae defetiscor defetiscor amissio corpus apud adhaero. Alveus abduco natus cras voluptas occaecati textus.',1952,129,'2025-05-19 13:45:47','2025-05-19 13:45:47',30),(32,'The role Code','Canis tremo quisquam absconditus. Avarus absconditus decet doloribus theatrum nobis cimentarius angulus vallum. Tonsor vero considero reprehenderit inflammatio delectus substantia cenaculum umquam.',1954,64,'2025-05-19 13:45:47','2025-05-19 13:45:47',17),(33,'tepid Dreams','Eum antiquus vulgo succurro amiculum victus amicitia. Tollo tantum a claro theologus. Cur vulgus aestas iste tristis rem.',1950,218,'2025-05-19 13:45:47','2025-05-19 13:45:47',28),(34,'spirited willow Rising','Curiositas sperno vulpes curriculum repudiandae audio degusto delibero adipiscor crepusculum. Vulnero coma universe eveniet una. Coaegresco desolo tabgo brevis timidus ara.',1975,175,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(35,'Chronicles of O\'Connell','Valens utilis nemo corrumpo. Vociferor suadeo optio vestigium corona. Dolor abundans deludo utroque blandior aequus uberrime cubitum vester curo.',1931,220,'2025-05-19 13:45:47','2025-05-19 13:45:47',12),(36,'Finding Jackie','Curvo creta earum sint calco non crur suadeo. Desipio cibo desipio admoneo repudiandae quia inventore vox. Deduco desino ad sustineo alter appositus corrupti careo.',1937,113,'2025-05-19 13:45:47','2025-05-19 13:45:47',23),(37,'A Tale of incomparable disk','Condico xiphias solvo cresco timor. Testimonium patrocinor summisse comptus delego tersus. Cohors capio odio termes confugo neque facilis avaritia.',1929,122,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(38,'The Curse of the guide','Coepi custodia via sursum aestas temporibus fugiat arbor. Commodi degusto patior tonsor vicissitudo. Calco crapula vigor cibo degero.',1963,64,'2025-05-19 13:45:47','2025-05-19 13:45:47',15),(39,'Return of the best-seller','Cimentarius tenus caries carbo desipio sollers usitas ratione amoveo. Cruciamentum vinculum degusto adeptio sumo comburo virgo. Toties validus minima.',2022,119,'2025-05-19 13:45:47','2025-05-19 13:45:47',5),(40,'Chronicles of Heaney','Apostolus vesper vos recusandae dicta adfectus dicta decerno uberrime. Adeptio depono dolorem amplitudo accendo admiratio. Depono suasoria tergiversatio socius antea blandior.',1955,113,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(41,'Return of the institute','Aspernatur avaritia eligendi. Tepesco custodia caste cohaero. Nostrum deprimo clarus utilis utroque peccatus saepe tempora.',1920,101,'2025-05-19 13:45:47','2025-05-19 13:45:47',14),(42,'Welcome to South Trenton','Victoria aperio doloribus bene exercitationem. Absorbeo cunctatio trucido demonstro qui cras atavus succedo. Atqui aer utrum acsi apostolus ceno cultellus.',1999,213,'2025-05-19 13:45:47','2025-05-19 13:45:47',6),(43,'Finding Darrick','Demum statim solitudo. Tergiversatio denuncio ubi maiores arma apostolus arca timidus bardus alioqui. Vomer tristis votum quae viscus.',1936,135,'2025-05-19 13:45:47','2025-05-19 13:45:47',9),(44,'My Life as a platter','Tamdiu clam aeternus curriculum pectus virga vulnus. Dicta delinquo comis nesciunt vociferor. Claro stips coma suadeo rerum spiritus.',1926,144,'2025-05-19 13:45:47','2025-05-19 13:45:47',27),(45,'Welcome to South Tremayneside','Rerum explicabo nesciunt sodalitas teneo tergum ter varietas minus ducimus. Tamen aestivus turpis reiciendis commodo. Succedo sequi confido conor volva.',1991,67,'2025-05-19 13:45:47','2025-05-19 13:45:47',2),(46,'peppery Dreams','Vulgus cilicium rem varius credo caelum molestias audacia pariatur tutamen. Tenetur uxor suasoria. Bis timor decipio thesis placeat conculco.',1971,99,'2025-05-19 13:45:47','2025-05-19 13:45:47',11),(47,'square and malfunction','Clementia suppono apud. Coaegresco timor reprehenderit allatus aegrotatio consectetur debeo consectetur somnus vae. Audio adipisci timidus recusandae.',2012,187,'2025-05-19 13:45:47','2025-05-19 13:45:47',2),(48,'Retta\'s dividend','Cornu timor apud. Triduana non defluo amitto assentator cornu sonitus. Copiose iure alveus bene tyrannus.',2005,215,'2025-05-19 13:45:47','2025-05-19 13:45:47',11),(49,'litter in the Time of flat','Terminatio vociferor capillus deprecator abduco vox trucido angustus sumo viriliter. Defluo correptius amitto modi ducimus nesciunt thalassinus viriliter bellicus. Velit delectatio compono arcus tabesco defluo artificiose vivo.',1957,108,'2025-05-19 13:45:47','2025-05-19 13:45:47',17),(50,'jagged sushi Rising','Clam super nisi territo adeo. Vindico demulceo amissio appono adfero depromo vitium. Celo trucido degero cupiditate vos vilis.',1998,142,'2025-05-19 13:45:47','2025-05-19 13:45:47',26);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `rating` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `movieId` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_user_id_movie_id` (`userId`,`movieId`),
  KEY `movieId` (`movieId`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movieId`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Crapula adduco verecundia deporto cribro tametsi. Facere tot architecto doloremque. Ullus vestrum tremo.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',39,10),(2,'Curia coniecto audentia nulla demergo comprehendo dolores. Adhuc caecus demo. Adicio desparatus aegrus tribuo terror.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',39,23),(3,'Titulus denuo agnitio adhuc cribro apto. Solum videlicet uter repellat congregatio coniecto cognatus clarus repudiandae suffoco. Conservo cohors amplitudo aqua civis color ea alveus.',1,'2025-05-19 13:45:47','2025-05-19 13:45:47',24,26),(4,'Ea villa colo demoror tabula tandem. Atqui vulgus pax delicate tricesimus tepesco fugiat. Super tristis decimus pariatur conor corrigo coniuratio.',1,'2025-05-19 13:45:47','2025-05-19 13:45:47',12,29),(5,'Crux vero corpus voluptatum certus comburo quasi. Conatus vado certus. Acies varius capillus depono tactus sollers decipio cotidie tenetur stips.',1,'2025-05-19 13:45:47','2025-05-19 13:45:47',15,3),(6,'Officia audeo compono ancilla volup amita. Arbitro carbo combibo spero voluptatum. Cura thema suffoco absens.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',30,9),(7,'Tamdiu una comptus admiratio confido adipiscor sunt vulariter cruentus. Cunae minus video uberrime combibo cresco cribro. Ter commodi accusator caelestis defleo tamdiu audacia mollitia.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',34,30),(8,'Quibusdam vespillo ter. Considero debeo ambulo villa armarium summisse demoror pecus valetudo. Desino aliqua audeo coniecto trucido.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',11,22),(9,'Coma vespillo quisquam taceo spoliatio vicinus enim acervus voluptate. Adiuvo denuo ubi centum tergeo omnis cotidie agnosco paens conduco. Demoror ulciscor nam terga benevolentia caput alo articulus.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',40,4),(10,'Atque vociferor fuga conservo porro calcar vulpes quos. Cunabula absorbeo decretum delicate deserunt verbera cogo. Vesco atqui atrocitas placeat ago.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',2,15),(11,'Coniecto cubitum collum. Denuncio excepturi consequuntur traho arbitro illum. Aut territo curia velut vix nobis somnus adimpleo cenaculum contego.',1,'2025-05-19 13:45:47','2025-05-19 13:45:47',8,27),(12,'Vulariter color clibanus absorbeo allatus aestivus. Vae tricesimus umquam ullam temperantia creta tum creo valetudo. Molestias balbus labore vulgo ambulo antiquus agnosco usitas at curso.',3,'2025-05-19 13:45:47','2025-05-19 13:45:47',34,5),(13,'Alienus talus cognatus spectaculum adflicto comburo claro uberrime. Deprecator clam alias curto cultellus tergo. Anser causa aestivus aeger.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',20,29),(14,'Totidem coerceo solum despecto titulus coruscus vobis tamen tabesco. Vitiosus denego subiungo animus bardus combibo. Solio abduco video apostolus acidus.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',2,3),(15,'Adipisci vigilo cado aequus tertius ait. Arca carbo cernuus cilicium possimus aestus artificiose eius. Numquam vorax umquam cibo arcesso accusamus praesentium.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',38,29),(16,'Defessus voro terreo aranea vociferor delectatio. Vulnero ea quisquam agnosco fuga. Amicitia abscido verecundia truculenter coadunatio bis theologus.',3,'2025-05-19 13:45:47','2025-05-19 13:45:47',10,7),(17,'Ubi vinculum creber vestigium adinventitias aut. Cinis acceptus tepidus voluptatem blandior spargo vesica. Aqua cito desino studio ullam cetera at conicio conicio minima.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',29,23),(18,'Vicinus quo volutabrum corporis ullam. Supplanto ars tamen caelestis ocer ante consequuntur. Ademptio vos autem supplanto solvo fugit territo facilis.',3,'2025-05-19 13:45:47','2025-05-19 13:45:47',31,14),(19,'Nobis usque eligendi cetera volo vehemens. Cubo dolorem coniuratio thalassinus adeptio uredo aeneus. Terra arcesso supplanto balbus quod vulnero decretum venio.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',28,12),(20,'Canto credo quidem xiphias. Summa verecundia degusto voluptatum degusto adulescens. Adopto adfero corrigo suffragium acerbitas voluptate.',2,'2025-05-19 13:45:47','2025-05-19 13:45:47',49,22),(21,'Administratio adduco unus corrigo peior vicinus terror debeo carbo agnitio. Demonstro aeneus despecto modi sed at stipes deprecator complectus thermae. Cariosus decimus commemoro.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',6,25),(22,'Tres ait spes aestas astrum defendo. Caries defero ambulo decumbo. Complectus caput provident debilito blandior.',3,'2025-05-19 13:45:47','2025-05-19 13:45:47',37,21),(23,'Cognomen contra supellex ullus admoveo voluptatem terror. Auditor debeo sollicito terga expedita tracto adicio certus. Quo vergo id spectaculum somnus.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',31,10),(24,'Sollicito sumo vinum. Varietas illo desidero voro subito arbitro tracto tergum defaeco contigo. Combibo una decipio aiunt tersus clamo voveo expedita arguo ventus.',3,'2025-05-19 13:45:47','2025-05-19 13:45:47',30,14),(25,'Suscipit colligo dens quia. Cavus torqueo rerum conturbo decretum condico. Turpis aegre cogo sodalitas.',5,'2025-05-19 13:45:47','2025-05-19 13:45:47',23,13),(26,'Adulatio tepidus approbo tergum tantum spero sponte conatus bos tametsi. Est textilis acervus arbor. Assumenda deprecator spoliatio condico tollo bellum quae volaticus torqueo.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',35,1),(27,'Comis strenuus pecco auctor dignissimos tibi perferendis summa thema. Uberrime tolero clamo charisma. Absum supra vespillo acer spargo clarus contigo una amor.',4,'2025-05-19 13:45:47','2025-05-19 13:45:47',44,25),(28,'Assentator uredo sapiente succurro sono cunabula desparatus velum validus cattus. In sumo audacia repellat sto abeo talus eum tot. Credo dicta quis sortitus adversus desparatus subito.',2,'2025-05-19 13:45:47','2025-05-19 13:45:47',7,3),(29,'Tendo quae accusantium caecus viduo decimus verbera non. Optio autem subito calculus cubicularis auctus agnosco tristis super verumtamen. Facilis mollitia appositus provident amitto adhuc.',2,'2025-05-19 13:45:47','2025-05-19 13:45:47',32,9),(30,'Versus iste occaecati pauper suggero vicissitudo bene uter aeternus approbo. Tunc solum cohaero arx illo ducimus teres sol adnuo. Defleo armarium officia spes.',1,'2025-05-19 13:45:47','2025-05-19 13:45:47',43,12),(31,'Amazing movie',4,'2025-05-19 13:51:11','2025-05-19 13:51:11',2,31),(32,'Bad Movie',1,'2025-05-19 13:51:40','2025-05-19 13:51:40',7,31),(33,'Mediocre Movie',3,'2025-05-19 13:53:05','2025-05-19 13:53:05',13,31),(34,'Fantastic Movie',5,'2025-05-19 13:54:40','2025-05-19 13:54:40',22,32);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('6NcVVMt_3pyaUlWSiWZjNVGlRNOeFBTH','2025-05-20 13:54:08','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":31}}','2025-05-19 13:46:26','2025-05-19 13:54:08'),('88FPoQ_ekKiwNC0zCATuMdIRgg4iTYAh','2025-05-20 14:04:49','{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"passport\":{\"user\":32}}','2025-05-19 13:46:32','2025-05-19 14:04:49');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `googleId` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'user',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `googleId` (`googleId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'667815868143192789857','Jasmine Jenkins','abby.orn@yahoo.com','https://avatars.githubusercontent.com/u/12654886','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(2,'139540094462402850605','Terry Gutmann','dolly95@yahoo.com','https://avatars.githubusercontent.com/u/98209497','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(3,'935081504101969560755','Oliver D\'Amore','katarina.schneider@hotmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/16.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(4,'285497569096316283868','Ruth Keeling I','garry_smith14@gmail.com','https://avatars.githubusercontent.com/u/14787842','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(5,'575053296055534870506','Johnathan Wyman Sr.','theron.schultz@hotmail.com','https://avatars.githubusercontent.com/u/46741507','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(6,'337499766199003393821','Betsy Dare-Koch','juston_bruen@hotmail.com','https://avatars.githubusercontent.com/u/2530674','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(7,'237349159875368931563','Clara Huel','ally_cummerata66@hotmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/5.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(8,'033413143699161277709','Dale Hamill','aimee.mclaughlin38@hotmail.com','https://avatars.githubusercontent.com/u/24992302','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(9,'964019997390661714634','Lucia Wilkinson','london.yost@yahoo.com','https://avatars.githubusercontent.com/u/61651467','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(10,'188229178677541380280','Ella Roob','wyatt_hermiston95@yahoo.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/59.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(11,'082913523484576820580','Mr. Terrance Hickle','julio32@hotmail.com','https://avatars.githubusercontent.com/u/46757614','admin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(12,'838247905322114465017','Randal Sawayn','lexi28@hotmail.com','https://avatars.githubusercontent.com/u/41207688','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(13,'488793231172042636174','Constance Oberbrunner','jayson.bode26@gmail.com','https://avatars.githubusercontent.com/u/23990219','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(14,'533358541036053453801','Rosalie Hand','piper.dibbert-gleichner@gmail.com','https://avatars.githubusercontent.com/u/30329163','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(15,'311766503432178556060','Seth Abernathy','brandi_bradtke@hotmail.com','https://avatars.githubusercontent.com/u/11040356','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(16,'218107566298626422311','Toby Goodwin','chadd_kutch@gmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/79.jpg','admin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(17,'287224885736745616038','Gene Klein','lilly_block@hotmail.com','https://avatars.githubusercontent.com/u/1033973','admin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(18,'155590522571927811097','Sue Goldner','myrl.bogisich38@yahoo.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/95.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(19,'288284810913694749738','Marcia Jacobs-Funk','orrin.huel@gmail.com','https://avatars.githubusercontent.com/u/37036872','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(20,'742431268242987677451','Sean Ullrich','baylee.kris89@yahoo.com','https://avatars.githubusercontent.com/u/9488772','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(21,'835480685587981259023','Miss Traci Abernathy','krystina73@yahoo.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/50.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(22,'542433118379277988492','Jeremiah Swift','ettie98@hotmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/2.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(23,'631449097796023351355','Orville Stark DDS','loma21@gmail.com','https://avatars.githubusercontent.com/u/2339525','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(24,'828245284049828049048','Tami Conroy','guillermo.gutmann@hotmail.com','https://avatars.githubusercontent.com/u/52001627','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(25,'689459476005232924565','Rosie Schultz','michaela_dooley84@hotmail.com','https://avatars.githubusercontent.com/u/32577966','admin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(26,'284868544928505580206','Candace Williamson','lesly53@gmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/25.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(27,'849728293500686885392','Charlotte Friesen','giuseppe.grant47@gmail.com','https://avatars.githubusercontent.com/u/17731749','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(28,'542082966700955980521','Candice Skiles','willis3@hotmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/48.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(29,'566696112625472945102','Martin Adams','maci.goldner@hotmail.com','https://avatars.githubusercontent.com/u/2334237','admin','2025-05-19 13:45:47','2025-05-19 13:45:47'),(30,'148151558815180721942','Homer Klocko','jules_langosh74@hotmail.com','https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/male/512/35.jpg','user','2025-05-19 13:45:47','2025-05-19 13:45:47'),(31,'111111111111111111111','Regular User','user@mail.com','https://lh3.googleusercontent.com/a/ACg8ocJ2qO6ELk8wS4MlZZQprshe8WVNHusm7TEXCigF0-8ysMHeag=s96-c','user','2025-05-19 13:46:26','2025-05-19 13:46:26'),(32,'777777777777777777777','Administrator','admin@mail.com','https://lh3.googleusercontent.com/a/ACg8ocK6hKtphsDpZASRpLxR37E5k6AE7bJknz0hZrk3KcQVeD6_pg=s96-c','admin','2025-05-19 13:46:32','2025-05-19 13:46:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-19 14:07:30
