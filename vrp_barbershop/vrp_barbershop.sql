--
-- Table structure for table `vrp_barbershop` For Evolution Software
-- Discord:https://discord.gg/RhWPgyptks
--

CREATE TABLE IF NOT EXISTS `vrp_barbershop` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `fathers` int(11) NOT NULL DEFAULT 0,
  `kinship` int(11) NOT NULL DEFAULT 0,
  `eyecolor` int(11) NOT NULL DEFAULT 0,
  `skincolor` int(11) NOT NULL DEFAULT 0,
  `acne` int(11) NOT NULL DEFAULT 0,
  `stains` int(11) NOT NULL DEFAULT 0,
  `freckles` int(11) NOT NULL DEFAULT 0,
  `aging` int(11) NOT NULL DEFAULT 15,
  `hair` int(11) NOT NULL DEFAULT 0,
  `haircolor` int(11) NOT NULL DEFAULT 0,
  `haircolor2` int(11) NOT NULL DEFAULT 0,
  `makeup` int(11) NOT NULL DEFAULT 0,
  `makeupintensity` int(11) NOT NULL DEFAULT 10,
  `makeupcolor` int(11) NOT NULL DEFAULT 0,
  `lipstick` int(11) NOT NULL DEFAULT 0,
  `lipstickintensity` int(11) NOT NULL DEFAULT 10,
  `lipstickcolor` int(11) NOT NULL DEFAULT 0,
  `eyebrow` int(11) NOT NULL DEFAULT 0,
  `eyebrowintensity` int(11) NOT NULL DEFAULT 10,
  `eyebrowcolor` int(11) NOT NULL DEFAULT 0,
  `beard` int(11) NOT NULL DEFAULT 0,
  `beardintentisy` int(11) NOT NULL DEFAULT 10,
  `beardcolor` int(11) NOT NULL DEFAULT 0,
  `blush` int(11) NOT NULL DEFAULT 0,
  `blushintentisy` int(11) NOT NULL DEFAULT 10,
  `blushcolor` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;