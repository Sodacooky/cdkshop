-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: cdkshop
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `game_info`
--

DROP TABLE IF EXISTS `game_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_info` (
  `id` char(4) NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` smallint NOT NULL,
  `category` varchar(32) NOT NULL,
  `pic_path` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_info`
--

LOCK TABLES `game_info` WRITE;
/*!40000 ALTER TABLE `game_info` DISABLE KEYS */;
INSERT INTO `game_info` VALUES ('0001','东方天空璋',40,'射击','touhou_tiankongzhang.jpg'),('0002','东方虹龙洞',40,'射击','touhou_honglongdong.jpg'),('0003','东方辉针城',40,'射击','touhou_huizhencheng.jpg'),('0004','东方神灵庙',32,'射击','touhou_shenlingmiao.jpg'),('0005','植物大战僵尸',16,'未分类','pvz.jpg'),('0006','碧蓝幻想',1,'角色扮演','gbf.jpg'),('0007','Grand Theft Auto V',1,'角色扮演','gtav.jpg'),('0008','Sekiro: Shadows Die Twice - GOTY Edition',150,'角色扮演','sekiro.jpg'),('0009','美少女万华镜 -理与迷宫的少女-',50,'射击','msnwhj5.jpg'),('0010','极限竞速：地平线4',100,'竞速','horizon4.jpg'),('0011','泰拉瑞亚(Terraria)',18,'角色扮演','terraria.jpg'),('0012','尘埃4(DiRT 4)',16,'竞速','dirt4.jpg'),('0013','模拟农场19',40,'未分类','fs19.jpg'),('0014','心跳文学部 Plus',40,'角色扮演','ddlcp.jpg'),('0015','城市：天际线',15,'未分类','cities_skylines.jpg'),('0016','巫师3：狂猎',24,'角色扮演','witcher3.jpg'),('0017','SHENZHEN I/O',18,'未分类','shenzhenio.jpg');
/*!40000 ALTER TABLE `game_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `cdk` varchar(128) NOT NULL,
  `game_id` char(4) NOT NULL,
  PRIMARY KEY (`cdk`),
  KEY `game_id` (`game_id`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('FAKE-CDK-FXDNHKZFGCQCDDLU','0001'),('FAKE-CDK-GCSKILUULARCCNER','0001'),('FAKE-CDK-GTVHTBEAVRDXFFQV','0001'),('FAKE-CDK-GWTEOWURXSCINWOV','0001'),('FAKE-CDK-HVWZYFKZKLERTINB','0001'),('FAKE-CDK-IQOVCWBMHGHSDTTL','0001'),('FAKE-CDK-JOTTTAFYXPQTKCOY','0001'),('FAKE-CDK-KHSXBEJQNCNCQVXA','0001'),('FAKE-CDK-KQKMIFFSKQRNNHDV','0001'),('FAKE-CDK-LDFSSEIDRWVYCAKG','0001'),('FAKE-CDK-LOFARSCNTADBLNMI','0001'),('FAKE-CDK-LUGQAFJPETIJCYOF','0001'),('FAKE-CDK-LUIHEVZTCERCCOKP','0001'),('FAKE-CDK-LXVPDMLDLXXZPVKK','0001'),('FAKE-CDK-MBQFGLRADYNHPMYT','0001'),('FAKE-CDK-MMFHJAVTPTOCDCTV','0001'),('FAKE-CDK-MPMSSSUEAIDJOOTD','0001'),('FAKE-CDK-MSGMMRXEPOXBQJXD','0001'),('FAKE-CDK-MVLMSCTEVVIBHVXX','0001'),('FAKE-CDK-NYQCMEQJJFPYCYAO','0001'),('FAKE-CDK-PMACRSGQCPXJDXBH','0001'),('FAKE-CDK-PMWJNPPCTJWTASOY','0001'),('FAKE-CDK-QDHIVYWLRDWIFETB','0001'),('FAKE-CDK-QJDIDQSMDYSEOTMM','0001'),('FAKE-CDK-RPXCLZIJRBMGGHDY','0001'),('FAKE-CDK-RSUKXDEQRPQRQWTE','0001'),('FAKE-CDK-RUGPCDHOZPUAPTLE','0001'),('FAKE-CDK-SVTBYTMYEZVRXFWL','0001'),('FAKE-CDK-TGOBBATVGNKRMOYX','0001'),('FAKE-CDK-TKXLMEGOXECBGCGI','0001'),('FAKE-CDK-TPPFZPYJIBVCGADE','0001'),('FAKE-CDK-UNEZVBVRFNLHKFPV','0001'),('FAKE-CDK-UWHVPMXCRRERJBTN','0001'),('FAKE-CDK-VYWEXUCLBTCKDWLF','0001'),('FAKE-CDK-WGJLEKSLHMYDIXVV','0001'),('FAKE-CDK-XKQPXIDCQTAQRKNY','0001'),('FAKE-CDK-YDANDBXVUBOFIFJZ','0001'),('FAKE-CDK-ZSYNFNHVJUSUQCOR','0001'),('FAKE-CDK-ZWKGGDMVUIZRMVQI','0001'),('FAKE-CDK-BAMLODYZNMHIVPUL','0002'),('FAKE-CDK-BZDNKBUKFSPXDSFC','0002'),('FAKE-CDK-CFPXIZMWNLJMNABS','0002'),('FAKE-CDK-CQUYDIJWEFNUBHSH','0002'),('FAKE-CDK-DPNWALONVRICOJKZ','0002'),('FAKE-CDK-DXSNNMXUYFONNDNB','0002'),('FAKE-CDK-ENNXHDRCRGXQBGTK','0002'),('FAKE-CDK-GIHYDEDMKFIVSKUC','0002'),('FAKE-CDK-GMOOSACENBGWYLWB','0002'),('FAKE-CDK-GPBRYVLTNRMACWHW','0002'),('FAKE-CDK-GTJCVUPAIXKKHDQY','0002'),('FAKE-CDK-GYRPLGZSZUFMFDGY','0002'),('FAKE-CDK-HYTKSCGIGILGGNHN','0002'),('FAKE-CDK-IIBGRPLQDQYORQQY','0002'),('FAKE-CDK-JHGETSRYQVHRMJWV','0002'),('FAKE-CDK-JRYBBDHQQCEHHKVE','0002'),('FAKE-CDK-JYOKMAPYYVKXCUYC','0002'),('FAKE-CDK-KKRUVQMEBVHUKYTR','0002'),('FAKE-CDK-KLZZMUTNSRLNCZWG','0002'),('FAKE-CDK-LPRUTPBJEFFNKRJA','0002'),('FAKE-CDK-MYRAPGVIVQOGRIAA','0002'),('FAKE-CDK-NKFODYFVGSCOOMVU','0002'),('FAKE-CDK-OPAEZTUBIGTXOAQI','0002'),('FAKE-CDK-OWLUOHXYCCUKWKXC','0002'),('FAKE-CDK-PACVATYPSIDJPSRN','0002'),('FAKE-CDK-SVRMDWTGAEHCNFPE','0002'),('FAKE-CDK-TAANTJAPQHRVHJDQ','0002'),('FAKE-CDK-TVJZBIUHCGFWWBFA','0002'),('FAKE-CDK-UECQUDIOMEXIKMMS','0002'),('FAKE-CDK-ULDAGWMAABOHGRRX','0002'),('FAKE-CDK-USAQGGDDUWDWHJDB','0002'),('FAKE-CDK-USGOBJBFXYKCSYUQ','0002'),('FAKE-CDK-VCXNIZWFSAAVDBXQ','0002'),('FAKE-CDK-VFGPZSSJWITOFIRC','0002'),('FAKE-CDK-VSJDJLIFXEIBABOW','0002'),('FAKE-CDK-WGTCGRFFDFZMYKGZ','0002'),('FAKE-CDK-WHRLGSSJYBELNMVR','0002'),('FAKE-CDK-XNVNPQRNHMGOIPFO','0002'),('FAKE-CDK-XQAMTVTXUWUWCFSR','0002'),('FAKE-CDK-XQWQKLIJVOBWEFBY','0002'),('FAKE-CDK-XRKFMSEELCJFHGRH','0002'),('FAKE-CDK-XVQRLUBYETPTWCNK','0002'),('FAKE-CDK-ZFFCFSYZSDMXEAZE','0002'),('FAKE-CDK-ZIGNOXZCFWVXRDTR','0002'),('FAKE-CDK-AJVLJAPQUSRVHTER','0003'),('FAKE-CDK-ARDRQHAPZKEUDLLN','0003'),('FAKE-CDK-ATJBOEIAMAFGUSOU','0003'),('FAKE-CDK-AUQNUPZMSWUXAMUI','0003'),('FAKE-CDK-AZLLFWFMTEBBTSKN','0003'),('FAKE-CDK-BNVGMOYQMMWURTAI','0003'),('FAKE-CDK-BVDNPBWYDOKSNZQR','0003'),('FAKE-CDK-CPFVPTATWNJSNOSL','0003'),('FAKE-CDK-DDLWKODBJTMBNFJC','0003'),('FAKE-CDK-EPESCUNNJFIRBJIL','0003'),('FAKE-CDK-FVBKERIDVQAIGNCB','0003'),('FAKE-CDK-GHLIEMQJXLETPJGA','0003'),('FAKE-CDK-GPRSLGHHFCYFIXKA','0003'),('FAKE-CDK-HBBEURRLCSIXIUJC','0003'),('FAKE-CDK-HDSGYOLMGWWHUSXZ','0003'),('FAKE-CDK-INUUZOEQCTSLAPSJ','0003'),('FAKE-CDK-IXKNNEYZFVVFJUVC','0003'),('FAKE-CDK-JHWKVWCUYSLDWLQF','0003'),('FAKE-CDK-KTZKSLRPIIZCWKMD','0003'),('FAKE-CDK-LEYMNRZPVDLWQDNP','0003'),('FAKE-CDK-MBBKNGTOTJIXZOZB','0003'),('FAKE-CDK-MBKAOLQXPHMUOSQF','0003'),('FAKE-CDK-MIVMCJNXOJXSGEXI','0003'),('FAKE-CDK-NCTIEBBJBZYWPHZP','0003'),('FAKE-CDK-NMZEQREIDNWOKEEZ','0003'),('FAKE-CDK-OJNDVEVIGTCIPIJD','0003'),('FAKE-CDK-PDXFPPTTVYXTUPCS','0003'),('FAKE-CDK-PLIBFCEPCQHIFVUM','0003'),('FAKE-CDK-QHUDXTPZFXTCUSFQ','0003'),('FAKE-CDK-QIBXCOQHLDFUUKSQ','0003'),('FAKE-CDK-QQXKSPALYGEHRIRY','0003'),('FAKE-CDK-REJJPHYIXADSRVUS','0003'),('FAKE-CDK-RXKNUGPHHULMJYIT','0003'),('FAKE-CDK-SOMQOKCORGDHHHLN','0003'),('FAKE-CDK-UIBMTYDTDDVXRXEK','0003'),('FAKE-CDK-UOGKLVKFCQAMUJPY','0003'),('FAKE-CDK-URKGCFTVDXTIUDME','0003'),('FAKE-CDK-UXPNJNNYKJLNBUKA','0003'),('FAKE-CDK-VPBRXPPYCYCQRSHP','0003'),('FAKE-CDK-WAYFNSPGDYJHPIPR','0003'),('FAKE-CDK-WGBKRZNAGSJNXSRE','0003'),('FAKE-CDK-XLZKNPYWAFMAVZPM','0003'),('FAKE-CDK-XRRXWYLDVBQGOIPK','0003'),('FAKE-CDK-XUFKCGVDAZTBXWRR','0003'),('FAKE-CDK-XUKMZTBZCHIUNDRX','0003'),('FAKE-CDK-XWLUIZTXUGIWDDUT','0003'),('FAKE-CDK-XXOHJDBSZPRAIXPS','0003'),('FAKE-CDK-XZSDJWUOCYOPHUZO','0003'),('FAKE-CDK-ZEQETGQAWQZJJPMH','0003'),('FAKE-CDK-ZIWCMNORNIWPYZXV','0003'),('FAKE-CDK-ZNEQAVDWDZNPNPTA','0003'),('FAKE-CDK-ASWEMDLXKNJYEBSQ','0004'),('FAKE-CDK-AWWNETYYRAJQCEIA','0004'),('FAKE-CDK-AZPKWFUXRWNJQOBG','0004'),('FAKE-CDK-BKPJSHVNYOLXOBQI','0004'),('FAKE-CDK-CCHHYQQCLIIKSPED','0004'),('FAKE-CDK-CEMEHMKOTLWOVZSG','0004'),('FAKE-CDK-CIABUZMTEWXGPAMX','0004'),('FAKE-CDK-CPIBRKLEPFYCPFNB','0004'),('FAKE-CDK-DEPPJGXJEXEYVVUP','0004'),('FAKE-CDK-FVOCZPNABTIYYLBG','0004'),('FAKE-CDK-GRAQJYGMBIOYZMPM','0004'),('FAKE-CDK-JYTKZNOUSYISLMPG','0004'),('FAKE-CDK-LESPWQPNLLSJBKIP','0004'),('FAKE-CDK-LJVOKFWSTJOWLKOA','0004'),('FAKE-CDK-NWMFRLVENKSWSXRS','0004'),('FAKE-CDK-PHHAUWWLYFOPHSFX','0004'),('FAKE-CDK-PIJQDVDSVRHPXFDJ','0004'),('FAKE-CDK-PJGDHLUVWFWFGCWL','0004'),('FAKE-CDK-PVEQEWGFXGYXFTRB','0004'),('FAKE-CDK-QFVFKLGJFJMTWWLY','0004'),('FAKE-CDK-RAIGPBVAAANORRQS','0004'),('FAKE-CDK-RDFAHYDBJXZVVUAX','0004'),('FAKE-CDK-REPCLCXXFORLJCTO','0004'),('FAKE-CDK-REPOHBQFVOLHUGYF','0004'),('FAKE-CDK-RHUACICGYPJQEZVT','0004'),('FAKE-CDK-RLUGMCZXPSEHHUUT','0004'),('FAKE-CDK-RSLUJFPKUCQGJREI','0004'),('FAKE-CDK-RWTEWHVNBXPGEHZL','0004'),('FAKE-CDK-SFVLADZHCNDGEHQQ','0004'),('FAKE-CDK-SWPNBFRZBYNQEYDF','0004'),('FAKE-CDK-SXGEFONGQLLOUHGA','0004'),('FAKE-CDK-TCWBHSVIIQGUQCKD','0004'),('FAKE-CDK-TPQPUZRZHQEZEPGJ','0004'),('FAKE-CDK-TUQHBTKWBTQBRVUU','0004'),('FAKE-CDK-UNYQTYZPZNOLUUAB','0004'),('FAKE-CDK-VIIBRJRWFUJJEDHH','0004'),('FAKE-CDK-VNWPBXMYVZTAAZEB','0004'),('FAKE-CDK-VQWZKCPFBQLOENPG','0004'),('FAKE-CDK-XLTIHAPETBTZFMOQ','0004'),('FAKE-CDK-XTAZQOZQATZJTRZR','0004'),('FAKE-CDK-XTCHFAFJKEENXWQL','0004'),('FAKE-CDK-XUCEIXCEUSNDCFHQ','0004'),('FAKE-CDK-XXSHFKFPLNHVOMTW','0004'),('FAKE-CDK-YGQSCIZTZIEVXZFQ','0004'),('FAKE-CDK-YRJAMQSNAHGEDPOM','0004'),('FAKE-CDK-ZHLBKZRBVLPRJGUJ','0004'),('FAKE-CDK-BEUDNBVELOTGLZGT','0005'),('FAKE-CDK-BOBGBSCYPSLEXRMO','0005'),('FAKE-CDK-BPAKJTCDDQDFCQFN','0005'),('FAKE-CDK-CDYGDAIYOBFRBMMT','0005'),('FAKE-CDK-CNKYFILHAALCYWXS','0005'),('FAKE-CDK-CSQPFZPDTZQHVMPG','0005'),('FAKE-CDK-CYVXPPLFESLYHBXK','0005'),('FAKE-CDK-DGSFCWKNMNEBNYAV','0005'),('FAKE-CDK-DIROQCJWMCNLGFBJ','0005'),('FAKE-CDK-DMLKBLFIOMWJZVVP','0005'),('FAKE-CDK-DMTLOKAMUEWWNCJU','0005'),('FAKE-CDK-DNFGVSXJRLHFKQTZ','0005'),('FAKE-CDK-ECHPOHZGYWMGVXLJ','0005'),('FAKE-CDK-FASRENJAWXMQLXTD','0005'),('FAKE-CDK-GEQAFJNSIBRRMCPK','0005'),('FAKE-CDK-HDKTDZQMALAVFARK','0005'),('FAKE-CDK-HQUJSCUORFPJAPSC','0005'),('FAKE-CDK-HUJPVJPBCDJCMUWX','0005'),('FAKE-CDK-ICZBDNOASDKOXRUB','0005'),('FAKE-CDK-IHEDDNYATJJTLVAH','0005'),('FAKE-CDK-IUVRJZKOMLXLUIED','0005'),('FAKE-CDK-IUZFRSCJAFFLXBAV','0005'),('FAKE-CDK-IVEARTFRSVTOFDFW','0005'),('FAKE-CDK-JKMLLYJNKEBSCWVE','0005'),('FAKE-CDK-LLRSZQUZIDFQMMZP','0005'),('FAKE-CDK-MCRFQCECOAHMPVSM','0005'),('FAKE-CDK-NZKLVEGUPVJXGGCA','0005'),('FAKE-CDK-NZYXOXRSDGOETNOD','0005'),('FAKE-CDK-OAODPTRNNIEDVLHZ','0005'),('FAKE-CDK-OJRRXUKGOKANGHZP','0005'),('FAKE-CDK-OQKPNJNIZAJMZSRD','0005'),('FAKE-CDK-ORUSEALQIDZMQBUX','0005'),('FAKE-CDK-QDSAIUVJWJLUDBUG','0005'),('FAKE-CDK-QICQVXPAVVUUYWTO','0005'),('FAKE-CDK-QPEYXDOMRWXTOKII','0005'),('FAKE-CDK-QRGTHVLYWNZQRRQL','0005'),('FAKE-CDK-RAVFXKFNVOIIDJTJ','0005'),('FAKE-CDK-RFZADCKLCNUJJCPX','0005'),('FAKE-CDK-RYNOSEZRZHTQUIFQ','0005'),('FAKE-CDK-TBSUBCLUVJYRQBSI','0005'),('FAKE-CDK-TVCAFGVWWLKZGUEJ','0005'),('FAKE-CDK-TYXJCSIQVHADDKLC','0005'),('FAKE-CDK-USJJHOAYAOSQFNOT','0005'),('FAKE-CDK-WCSTRKRKOMGYUUDC','0005'),('FAKE-CDK-WKWQMYDZEKKXSTKT','0005'),('FAKE-CDK-WVHQPOUBVNNKQXFV','0005'),('FAKE-CDK-YXDYFWPWOJCMHRVE','0005'),('FAKE-CDK-ZGDBYCQKBTHKBXIG','0005'),('FAKE-CDK-ZTPFOWIHOJKGMJQM','0005'),('FAKE-CDK-NRICAAQJOHIZDGRN','0006'),('FAKE-CDK-NUUTEQLMPGBRFOAY','0006'),('FAKE-CDK-NXHWTQFRRXLUCMZH','0006'),('FAKE-CDK-NXVTGFPOXNWLZMWS','0006'),('FAKE-CDK-OAOCPNWZDBSPSPXI','0006'),('FAKE-CDK-OMHJWLHLMDESEPUK','0006'),('FAKE-CDK-OQQBIONXRFMRNJKZ','0006'),('FAKE-CDK-OQVPKDRYRCRLCWMQ','0006'),('FAKE-CDK-PGBMPZSDWODFQZUA','0006'),('FAKE-CDK-PTXVUZXMPHEDBZCF','0006'),('FAKE-CDK-RGZVPHVEAWKVQZOG','0006'),('FAKE-CDK-ROYFAUENBSIDBWOB','0006'),('FAKE-CDK-RTMUDBWEDMVVEISE','0006'),('FAKE-CDK-RXJLHKPLFSEWUBQV','0006'),('FAKE-CDK-RYCLNBFFJIFQIUSS','0006'),('FAKE-CDK-RYMPAVLELWJHGQAZ','0006'),('FAKE-CDK-SAPCAQMCRETOXAHR','0006'),('FAKE-CDK-TCEIZTNXZZTKFODW','0006'),('FAKE-CDK-TINDFSDNCACWGLUM','0006'),('FAKE-CDK-UANDLETRFJWLZAWO','0006'),('FAKE-CDK-UJLCHLSHYFWLTTPO','0006'),('FAKE-CDK-UQLWHCEWYHWQNEJW','0006'),('FAKE-CDK-UUSQCWOIMKHNBFIJ','0006'),('FAKE-CDK-VSHFHGFCBPPDCQHL','0006'),('FAKE-CDK-WIVXYMHSIZBAWIAO','0006'),('FAKE-CDK-XKVKARHLNSRLUIIC','0006'),('FAKE-CDK-XSBPRANKTPKUTKCS','0006'),('FAKE-CDK-YGHPZDHZZQKCHMYI','0006'),('FAKE-CDK-TUSEMADONCJNHXVZ','0007'),('FAKE-CDK-TXIRYBZYWHVPZXUF','0007'),('FAKE-CDK-TZHFJXSOLBTIJAVA','0007'),('FAKE-CDK-UBKPAEUSLXJDAPHA','0007'),('FAKE-CDK-UFGERCMKTJJBZYBZ','0007'),('FAKE-CDK-UZZNZNHPNROTABNG','0007'),('FAKE-CDK-VKNBYFPWGLKMWFIV','0007'),('FAKE-CDK-WCMGUEKKQAXNDHID','0007'),('FAKE-CDK-WGRBCFUMHULKLGDC','0007'),('FAKE-CDK-WJGOEBAJRUQDXPSH','0007'),('FAKE-CDK-WXTUQUXZUSBQKOBG','0007'),('FAKE-CDK-WZZLJADGQIOJWKTH','0007'),('FAKE-CDK-XNQHLFJKWYWPVWVZ','0007'),('FAKE-CDK-YFCYVYGIEJZQUJCC','0007'),('FAKE-CDK-YTBJEVMOENDCWSBR','0007'),('FAKE-CDK-YZPUCOPVZUBVOFNX','0007'),('FAKE-CDK-ZZGXABPCADZHRVZK','0007'),('FAKE-CDK-CCRQQTBAHPHNRNFB','0008'),('FAKE-CDK-CPIWZUBAHBBYBZGE','0008'),('FAKE-CDK-DBLKCKCELLSHMDIL','0008'),('FAKE-CDK-EDCCGOIRCQJBKYVJ','0008'),('FAKE-CDK-EFICUZZLPRRAVYIS','0008'),('FAKE-CDK-EZOLMCKQCUCTBBGM','0008'),('FAKE-CDK-FKUULUIONIVTTKLM','0008'),('FAKE-CDK-FXFBIVHPEAUEWENH','0008'),('FAKE-CDK-GKCJGOWUFJGXDKIO','0008'),('FAKE-CDK-GSCSLSLYAYWDFPVH','0008'),('FAKE-CDK-GZGNRVQXSSSQMPSH','0008'),('FAKE-CDK-HAGMQUKJFLOMVBTB','0008'),('FAKE-CDK-IYZEEKZJNJBNRDTD','0008'),('FAKE-CDK-JETTVMKSTBXETYQL','0008'),('FAKE-CDK-JKMQYICMPCTGJNVM','0008'),('FAKE-CDK-JMEOTAGPWBLYRINK','0008'),('FAKE-CDK-KGJXAROWQCYSQDGY','0008'),('FAKE-CDK-KMUQUNZRWWUMZLDZ','0008'),('FAKE-CDK-KZUROYFMRAHNHCYJ','0008'),('FAKE-CDK-LTQOSMUZZUUILXYK','0008'),('FAKE-CDK-MALQWELEJXZHYSFH','0008'),('FAKE-CDK-NSDHFWZGHPKLQHMA','0008'),('FAKE-CDK-OHZVPNZIBHWZDUTR','0008'),('FAKE-CDK-OMFEHTIIODQQVLTP','0008'),('FAKE-CDK-OMKPXLZFFTSYIFWJ','0008'),('FAKE-CDK-OUNBHHXJKRVSUWIK','0008'),('FAKE-CDK-QPFKGKNZHUTNUINL','0008'),('FAKE-CDK-QROHCDLLLGCECDRG','0008'),('FAKE-CDK-RGDEUEGOEPQPFAHX','0008'),('FAKE-CDK-RGUZRAETBFUYVKSB','0008'),('FAKE-CDK-RHMMDBLAXOKSOGBY','0008'),('FAKE-CDK-SDEAFHYJWCJKLAAE','0008'),('FAKE-CDK-SIGMDXHSTEQTAYVY','0008'),('FAKE-CDK-SOJYWCVTUUQVTTNP','0008'),('FAKE-CDK-SWTRWCYAWMYRKARQ','0008'),('FAKE-CDK-TOFZNWCHXTUZUZLV','0008'),('FAKE-CDK-USMUJYCOYEVTGQEB','0008'),('FAKE-CDK-VCBBLPNIDIQESZVK','0008'),('FAKE-CDK-VTRGOAKGZANLEJXO','0008'),('FAKE-CDK-VXFJLVSJYBABAVDB','0008'),('FAKE-CDK-WLGZAHCJSSZQHNVY','0008'),('FAKE-CDK-WMLGSYWNDLQLFNHI','0008'),('FAKE-CDK-WYAXGXCJMNOBWTGB','0008'),('FAKE-CDK-XLXICJCDCYPSCDXE','0008'),('FAKE-CDK-XONTBCXVQRBGWRJF','0008'),('FAKE-CDK-XSMAQKYMBLBXUBXP','0008'),('FAKE-CDK-YTGIZHEMASYLBYJU','0008'),('FAKE-CDK-ZPXEYNDWACXIEWDK','0008'),('FAKE-CDK-ZZNSCKTFQPIBNIZU','0008'),('FAKE-CDK-AUOUZIIMAGXSQMVD','0009'),('FAKE-CDK-CBDOGHOLOMHEOKIJ','0009'),('FAKE-CDK-CCQUUOHGPUGXOOTS','0009'),('FAKE-CDK-CDJBKJVZOJDGPGDE','0009'),('FAKE-CDK-CJTNCJCLKLSYETVC','0009'),('FAKE-CDK-CNEHDEWTZTDDXWJR','0009'),('FAKE-CDK-CSWKNQFUNPBCUQNA','0009'),('FAKE-CDK-DKWIPXUPWISYDGTG','0009'),('FAKE-CDK-EAEAVXFVLOFHRHKG','0009'),('FAKE-CDK-EBGNOFJTAGWQWXMT','0009'),('FAKE-CDK-FFVNWYLTSKAFOMHB','0009'),('FAKE-CDK-FTKLLNTSIXKZTXMM','0009'),('FAKE-CDK-GINRFYLZYBUBHWEV','0009'),('FAKE-CDK-GOZBHOWXWODXVUVV','0009'),('FAKE-CDK-GZONQGZWNGLQWYFP','0009'),('FAKE-CDK-HJHCMTFJUMIBBRMN','0009'),('FAKE-CDK-HVWLVNEAMGBPAMCN','0009'),('FAKE-CDK-IPFHMHDGUFARLWQO','0009'),('FAKE-CDK-ITNXOAXOXMRLTATC','0009'),('FAKE-CDK-JXGRIGVVPWGQWLVM','0009'),('FAKE-CDK-JZDDIFHCWNGSEWUT','0009'),('FAKE-CDK-JZWRJUTQXIPMUYRX','0009'),('FAKE-CDK-KROKOUGCVGVXOFEK','0009'),('FAKE-CDK-LCWSFZDUZRRHHPAW','0009'),('FAKE-CDK-LQREYNQVLFPVSRIL','0009'),('FAKE-CDK-MKPYDODDVZTHSDKL','0009'),('FAKE-CDK-MNFOXASHRYAGOPPA','0009'),('FAKE-CDK-OVOEDNOLHLOLRGJM','0009'),('FAKE-CDK-OWIFSYWSKVAAXWVF','0009'),('FAKE-CDK-QQIMCLXMKGTCRWXK','0009'),('FAKE-CDK-QRHPEMEAJYSHRYXB','0009'),('FAKE-CDK-QTHOXEWGOKPNBZJX','0009'),('FAKE-CDK-QUPKZYRJFGOXPYXU','0009'),('FAKE-CDK-QUYTLOWKDWJQYYCR','0009'),('FAKE-CDK-QVRUEAYBHGFZRPLH','0009'),('FAKE-CDK-SJLZDCJNOIMCHKKN','0009'),('FAKE-CDK-SKFXLBWBPARSBTVL','0009'),('FAKE-CDK-UQCPJTEZPBQWSJSQ','0009'),('FAKE-CDK-UUBHUHALERGPSGDB','0009'),('FAKE-CDK-UXTXKMXQCMKFBSCO','0009'),('FAKE-CDK-VOOFGCCOJRKCIAIQ','0009'),('FAKE-CDK-VRBZJCICLYHYQEWL','0009'),('FAKE-CDK-WOPKASSORXZWTIXE','0009'),('FAKE-CDK-XFDPDKHBSAIUYCSK','0009'),('FAKE-CDK-XHFYIGBYBLARVWSX','0009'),('FAKE-CDK-XNRBGZBDSFCYYVRB','0009'),('FAKE-CDK-XOPCLGRNORTENYUI','0009'),('FAKE-CDK-ZCIHYAXLNAKCBBGV','0009'),('FAKE-CDK-ZINQEQJFFQKWPYIL','0009'),('FAKE-CDK-ZZNEOBIDVUJLAQCF','0009'),('FAKE-CDK-CAQRYPEGUUOBTCTO','0010'),('FAKE-CDK-CYSOCWCAIJSRVTHI','0010'),('FAKE-CDK-DSDTKMTYDWVWFXGU','0010'),('FAKE-CDK-EQBQHFDPLCTORCGI','0010'),('FAKE-CDK-ERCQCXPZIGONNXJF','0010'),('FAKE-CDK-ERJBEOXZKOKWEZAL','0010'),('FAKE-CDK-FYKWTFTVSKRAJOJT','0010'),('FAKE-CDK-HRGZODEANHJROZXE','0010'),('FAKE-CDK-IXZAYIMNNLJBQAZS','0010'),('FAKE-CDK-JMAEJTQNOYZIEYNZ','0010'),('FAKE-CDK-JSFVEPFPOEYSWFMN','0010'),('FAKE-CDK-KGJPCNYNEIIQTGJZ','0010'),('FAKE-CDK-KQYYRMCGYWMBWBQT','0010'),('FAKE-CDK-MPDMHSZXLMMIBSCI','0010'),('FAKE-CDK-NTLBFRSXIHRJFKFP','0010'),('FAKE-CDK-OMTVROZYULGTTWWG','0010'),('FAKE-CDK-OQUHIJKQOHYSVFCJ','0010'),('FAKE-CDK-OWPLFJMPALRHUKXE','0010'),('FAKE-CDK-OZJRAKAXXJTEEDLU','0010'),('FAKE-CDK-POAAJNDMYUGXHTXG','0010'),('FAKE-CDK-QJMJKULSWYHPLXOA','0010'),('FAKE-CDK-RONAKJRIPMELJUJI','0010'),('FAKE-CDK-RZCUOGQHMHSPOUYL','0010'),('FAKE-CDK-SBIUUKASJIDGMRGQ','0010'),('FAKE-CDK-TBHISZJAGNUHMSHC','0010'),('FAKE-CDK-TDPZZIEHFGBZDRHH','0010'),('FAKE-CDK-TZAIDVMIBTCJGHKF','0010'),('FAKE-CDK-UACJRYQDGTYEJGBZ','0010'),('FAKE-CDK-ULIQTULEDQZXINIF','0010'),('FAKE-CDK-UWCXHYLFFRASABMR','0010'),('FAKE-CDK-VFLTQVOWYSXLNPAI','0010'),('FAKE-CDK-VHZWXIUKOADPNOZU','0010'),('FAKE-CDK-WTUQNUNXPGDCWOBV','0010'),('FAKE-CDK-WVREJZMTMVLOELTW','0010'),('FAKE-CDK-WWXTSULUXBLELPGW','0010'),('FAKE-CDK-XTWOCKXVYQJNZJQD','0010'),('FAKE-CDK-YCNOGNIUOYPEIAXW','0010'),('FAKE-CDK-YMTQWVAWSKOUMUTR','0010'),('FAKE-CDK-ZABLCVWWVPXZZYJT','0010'),('FAKE-CDK-ZSSCZXZFKLECSFST','0010'),('FAKE-CDK-AOWBTDWVLKEBJABE','0011'),('FAKE-CDK-APIJIVHQRZEOTAJC','0011'),('FAKE-CDK-CIAVRVMCZPGEDCRG','0011'),('FAKE-CDK-CWLTQVYMCFNLINPF','0011'),('FAKE-CDK-DIFDXJIELBTAGPJZ','0011'),('FAKE-CDK-EXQDXXXDQKCEVXFQ','0011'),('FAKE-CDK-EZAFWTIFWVVNRXEA','0011'),('FAKE-CDK-FKNCMEZAGVIPRRII','0011'),('FAKE-CDK-GFIPPYLYMLPGMCCK','0011'),('FAKE-CDK-GWJBJZAFTVHUMEGL','0011'),('FAKE-CDK-HLOYLQJARUJWJSSM','0011'),('FAKE-CDK-HPANDQVUSGUPXGXE','0011'),('FAKE-CDK-IKCIZESLWFUGEIMO','0011'),('FAKE-CDK-IVLFWBTGFDSBWOCQ','0011'),('FAKE-CDK-JACCUAXHRVFTJUJZ','0011'),('FAKE-CDK-JBKEDGAJBDDNASJO','0011'),('FAKE-CDK-JKRZGSZAOYWHUWOH','0011'),('FAKE-CDK-JNXZLSFRRALELCNZ','0011'),('FAKE-CDK-JOFYOFAKGTGUIEKC','0011'),('FAKE-CDK-JRUUIOTOWNFXHHWG','0011'),('FAKE-CDK-KJEYPMNJBJJBVPAR','0011'),('FAKE-CDK-LBYCYBWWZXKMCGQO','0011'),('FAKE-CDK-LPUYMHOEWJUUNFTU','0011'),('FAKE-CDK-NYWNTUKRBKSLOMUR','0011'),('FAKE-CDK-OJXGNCIYQIPKAYLB','0011'),('FAKE-CDK-POECJJENRNMWCWSM','0011'),('FAKE-CDK-RRVCINIVXCYQITBM','0011'),('FAKE-CDK-SDIRPZOCUYRDQCZT','0011'),('FAKE-CDK-TJUNUPDQAUOXRLRF','0011'),('FAKE-CDK-VAIQUMHMHFSHLBPR','0011'),('FAKE-CDK-VAYJIOYNVGAHKYSC','0011'),('FAKE-CDK-XHXLRSJMOZCLQPOA','0011'),('FAKE-CDK-XQGDQQSTPAXZASQM','0011'),('FAKE-CDK-XTNLPYROEVSZFOWK','0011'),('FAKE-CDK-YIKQYKQDZRRBPGOR','0011'),('FAKE-CDK-YOSNRYPCFWKPGCJM','0011'),('FAKE-CDK-YWVTVBIBATARHFRD','0011'),('FAKE-CDK-ZDLKZYEXQFWUFCWM','0011'),('FAKE-CDK-EDVRASYHKJJKZURE','0012'),('FAKE-CDK-FOYXEESUEVUTENUG','0012'),('FAKE-CDK-GBXDKYEHLKJMYFWU','0012'),('FAKE-CDK-HITVXVNJNSLWRDXT','0012'),('FAKE-CDK-HJAMVUJBNMOBWLZJ','0012'),('FAKE-CDK-HUTKQLAGFLSVKSPP','0012'),('FAKE-CDK-INTIAEXXKMBBPCIR','0012'),('FAKE-CDK-ISDRDMVKYCTCWMYX','0012'),('FAKE-CDK-JVCBRBOTCSDZZIPF','0012'),('FAKE-CDK-KKMDXKYLNPQRIIAL','0012'),('FAKE-CDK-KQTDZWNOSMGHGBAU','0012'),('FAKE-CDK-LLDCCBBWZWOSHXSQ','0012'),('FAKE-CDK-LYOSRWLHHASQYHGT','0012'),('FAKE-CDK-MRDJXRBWOOZFLCYQ','0012'),('FAKE-CDK-MRESRXOSKJJQMRWZ','0012'),('FAKE-CDK-NJHLCIOHSTBCWBZK','0012'),('FAKE-CDK-NTYWIYYLEGGTBEJX','0012'),('FAKE-CDK-NVBBCOMGZFUADFKM','0012'),('FAKE-CDK-OBTVNQBKEJBMGJBZ','0012'),('FAKE-CDK-PJJEURSURLOGWLTY','0012'),('FAKE-CDK-QYVEGEZJCTCVMYEB','0012'),('FAKE-CDK-RCEVDDOQTTHPFLIX','0012'),('FAKE-CDK-RJNYJCHVWFVPFCWK','0012'),('FAKE-CDK-RLGKBXOZIDVENJTD','0012'),('FAKE-CDK-RXTTXONZIKVYTAAN','0012'),('FAKE-CDK-SPKINIQQVQJYVRLG','0012'),('FAKE-CDK-UCDOIOJXYVQFURFU','0012'),('FAKE-CDK-UTAFAFMBZVFRWLSW','0012'),('FAKE-CDK-VDJUQUVKGCAUVFCY','0012'),('FAKE-CDK-VMOVTJVZEEZQUQZG','0012'),('FAKE-CDK-VNIGYKCBMVGDVLNS','0012'),('FAKE-CDK-VWGWLMCONZPFENZA','0012'),('FAKE-CDK-XCZTKBKDUXXLPTUJ','0012'),('FAKE-CDK-YDXWLICDFAHGZTKB','0012'),('FAKE-CDK-YGYAYFCIWJJXKEPT','0012'),('FAKE-CDK-YZYCKDSJHCLLNMRO','0012'),('FAKE-CDK-AFIEKCWJSHCTBJMS','0013'),('FAKE-CDK-AVZQAKMWQMEODEUU','0013'),('FAKE-CDK-BBHPUCGJLRLSIHBY','0013'),('FAKE-CDK-CVFHQWEUNWDMSVTO','0013'),('FAKE-CDK-FFGRUOYWCGCBWHHN','0013'),('FAKE-CDK-GANLXRAGSTYFIRFM','0013'),('FAKE-CDK-GHFLVZWPCTFLTZQD','0013'),('FAKE-CDK-HQPGLSUXRXSEHOUY','0013'),('FAKE-CDK-HTVMVOYWSGXLGTIS','0013'),('FAKE-CDK-ILCZHUQDZEXOIBCJ','0013'),('FAKE-CDK-KHHLJGEYDDCWEYYT','0013'),('FAKE-CDK-LYCSUZYTBLQQZXRV','0013'),('FAKE-CDK-NEHOJHQDKYRLIJPX','0013'),('FAKE-CDK-NSXSMWXJJFSZEDQD','0013'),('FAKE-CDK-NXXHQGQRDQMFHUZU','0013'),('FAKE-CDK-OSXMNNYUZWLYLQIU','0013'),('FAKE-CDK-RQBOPMAAWZISYAXN','0013'),('FAKE-CDK-RXSFPRBQVXZSKNIP','0013'),('FAKE-CDK-SWCSOHXQWWVNUBUF','0013'),('FAKE-CDK-TBVUILVEDFRFWQMK','0013'),('FAKE-CDK-TILHUANZWKQOLLOM','0013'),('FAKE-CDK-TRYZUPSNBKBDSICH','0013'),('FAKE-CDK-UFILCCQOLVESOONH','0013'),('FAKE-CDK-VQOFHRDYVEBSUWEL','0013'),('FAKE-CDK-VXUGWQPQLTCHQLJI','0013'),('FAKE-CDK-WASFJXJWWQPYFPMB','0013'),('FAKE-CDK-WGLGCLARWZXFFHHU','0013'),('FAKE-CDK-XBZNFHEJTYYIDFLY','0013'),('FAKE-CDK-XTKIAVPHIQABMPCF','0013'),('FAKE-CDK-XVNJUJLFOXZCSQZL','0013'),('FAKE-CDK-YCOYLFMPULZHUTRQ','0013'),('FAKE-CDK-YONZSSBXGVNRGISO','0013'),('FAKE-CDK-ZAWWLYXESYIXTHLB','0013'),('FAKE-CDK-ZFXRQNEHZBEWJGOZ','0013'),('FAKE-CDK-WXAZEHRWZXPAIKKX','0014'),('FAKE-CDK-XCSVCUDQMCWTNEST','0014'),('FAKE-CDK-XDXHJPTMECDIOYNF','0014'),('FAKE-CDK-XONVCUBFVNXOCRGD','0014'),('FAKE-CDK-YQKZPHDEICNLBTLT','0014'),('FAKE-CDK-ZNGVAYFGVHYPYZRF','0014'),('FAKE-CDK-ZNJNIKXXKOPCTXAB','0014'),('FAKE-CDK-ZYWLCLXFYRGAAJAA','0014'),('FAKE-CDK-ESXSLZSSPWWKHDFH','0015'),('FAKE-CDK-GBAWRJKVNQXGXTZU','0015'),('FAKE-CDK-HFJJSCZCLSTZKWMM','0015'),('FAKE-CDK-HOONVHUAGMFRTOAQ','0015'),('FAKE-CDK-JGITLXYHFQUAGIWD','0015'),('FAKE-CDK-LJFPLOQPVNGOOLAV','0015'),('FAKE-CDK-LSZYQNWOUEDJXWHL','0015'),('FAKE-CDK-MHSYXBKFNISZFXZB','0015'),('FAKE-CDK-MWHRJICKMOSLPTYE','0015'),('FAKE-CDK-MWQSUYKENFKULASH','0015'),('FAKE-CDK-NHXWZNWLGOFKXTXQ','0015'),('FAKE-CDK-NQEBCMLWZRBLYUDC','0015'),('FAKE-CDK-NTGGHNDWEBHWGVCX','0015'),('FAKE-CDK-OOBKGOSWNTXGDNMM','0015'),('FAKE-CDK-OQHZLZUNGLKBCDOS','0015'),('FAKE-CDK-PCPKOVNJHDVVAJLH','0015'),('FAKE-CDK-PDDLNULCJHGGMYQM','0015'),('FAKE-CDK-PNSGOXJBMUEJBMYY','0015'),('FAKE-CDK-PPVIYKPIKMIKQKBE','0015'),('FAKE-CDK-QJZSGDMMTQECKYTL','0015'),('FAKE-CDK-QUYREOPPHVVPZEJE','0015'),('FAKE-CDK-QWLAPXUTWPYUJNLR','0015'),('FAKE-CDK-RLEASJWBJORWZOKL','0015'),('FAKE-CDK-TGFZMZWXGCKZNQZS','0015'),('FAKE-CDK-VAPKXEPYGJCCXGVX','0015'),('FAKE-CDK-VVOSNPUWXEEXUVML','0015'),('FAKE-CDK-WJPNXYRODFVTQKUB','0015'),('FAKE-CDK-XAIZFQBNYGSQPCIW','0015'),('FAKE-CDK-XGNJIXVOZLWRIUXL','0015'),('FAKE-CDK-XLPOAGIGAODOGXPJ','0015'),('FAKE-CDK-YOWDIUPTVPZZHMPM','0015'),('FAKE-CDK-YUZDQSKJCHJFYLME','0015'),('FAKE-CDK-ZEWLJGYRZRFGZDIJ','0015'),('FAKE-CDK-ZJJVCTYXKGBVWOFL','0015'),('FAKE-CDK-ZKCCPOQFRYOZYXNE','0015'),('FAKE-CDK-BESRTZILPODWDJSM','0016'),('FAKE-CDK-CLRNYAHHBJVZAQYV','0016'),('FAKE-CDK-DWHAIJKNNYRXUZYN','0016'),('FAKE-CDK-EHPIOTFSPNQAQJGW','0016'),('FAKE-CDK-KCWSYBLDELKLXDEI','0016'),('FAKE-CDK-OBRHPMWMAQLPWRGK','0016'),('FAKE-CDK-XBTYSPVETJZJDINW','0016'),('FAKE-CDK-XGECOBCMKRDMJMSF','0016'),('FAKE-CDK-ZHVPGLTECCSTMTDS','0016'),('FAKE-CDK-ZTSNHKREVKDBRFYS','0016'),('FAKE-CDK-IRMLPVDQVMGKVNYG','0017'),('FAKE-CDK-JUDCLOYYTQRYGCNP','0017'),('FAKE-CDK-LBHBYSBBMCHKXFGE','0017'),('FAKE-CDK-LBVGXYQGEOSNBMEK','0017'),('FAKE-CDK-LFCJTJYMPGEAKVPC','0017'),('FAKE-CDK-NXHGFFEHRJFNLQXF','0017'),('FAKE-CDK-UBOILTAHEFGAONEN','0017'),('FAKE-CDK-XQWHNVEUPGOCVVQJ','0017'),('FAKE-CDK-ZWHIKFJMMMZSQVCQ','0017'),('LUCK-FAKE-CDK-1145141919810','0017');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-05 23:56:58
