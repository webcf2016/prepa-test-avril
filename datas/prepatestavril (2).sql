-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 11 Avril 2016 à 12:17
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `prepatestavril`
--

--
-- Vider la table avant d'insérer `perm`
--

TRUNCATE TABLE `perm`;
--
-- Contenu de la table `perm`
--

INSERT INTO `perm` (`id`, `lintitule`, `ecriture`, `modif`, `modif_tous`, `sup`, `sup_tous`) VALUES
(1, 'Administrateur', 1, 1, 1, 1, 1),
(2, 'Modérateur', 1, 1, 1, 1, 0),
(3, 'Correcteur', 0, 0, 1, 0, 0),
(4, 'Contributeur', 1, 1, 0, 1, 0);


--
-- Vider la table avant d'insérer `util`
--

TRUNCATE TABLE `util`;
--
-- Contenu de la table `util`
--

INSERT INTO `util` (`id`, `lelogin`, `lepass`, `perm_id`) VALUES
(1, 'admin', 'admin', 1),
(2, 'modo', 'modo', 2),
(3, 'corrige', 'corrige', 3),
(4, 'contrib', 'contrib', 4),
(5, 'contrib2', 'contrib2', 4);


--
-- Vider la table avant d'insérer `article`
--

TRUNCATE TABLE `article`;
--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `letitre`, `lemessage`, `ladate`, `util_id`) VALUES
(1, 'VISUAL SLIDE BOX BUILDER ', 'Un outil qui vous permet de construire des animations à l’aide d’une interface WYSIWYG.\r\n\r\nAucune expérience de codage n’est nécessaire, intuitive et facile à utiliser. Après la création de votre animation il suffit de l’enregistrer et de copier le « shortcode » sur une page ou un article de votre site.\r\n\r\nL’extension se nomme → Visual Slide Box Builder → au téléchargement dans la barre latérale gauche de WP l’extension se nomme → Virtual Slide Box Builder → sur le net vous pourrez la trouver sous le nom de → Visuel Slide Box Builder', '2016-04-11 10:09:15', 4),
(2, 'git-branch - List, create, or delete branches', 'Show changes between the working tree and the index or a tree, changes between the index and a tree, changes between two trees, changes between two blob objects, or changes between two files on disk.\r\n\r\ngit diff [--options] [--] [<path>…​]\r\nThis form is to view the changes you made relative to the index (staging area for the next commit). In other words, the differences are what you could tell Git to further add to the index but you still haven’t. You can stage these changes by using git-add(1).\r\n\r\ngit diff --no-index [--options] [--] [<path>…​]\r\nThis form is to compare the given two paths on the filesystem. You can omit the --no-index option when running the command in a working tree controlled by Git and at least one of the paths points outside the working tree, or when running the command outside a working tree controlled by Git.\r\n\r\ngit diff [--options] --cached [<commit>] [--] [<path>…​]\r\nThis form is to view the changes you staged for the next commit relative to the named <commit>. Typically you would want comparison with the latest commit, so if you do not give <commit>, it defaults to HEAD. If HEAD does not exist (e.g. unborn branches) and <commit> is not given, it shows all staged changes. --staged is a synonym of --cached.\r\n\r\ngit diff [--options] <commit> [--] [<path>…​]\r\nThis form is to view the changes you have in your working tree relative to the named <commit>. You can use HEAD to compare it with the latest commit, or a branch name to compare with the tip of a different branch.\r\n\r\ngit diff [--options] <commit> <commit> [--] [<path>…​]\r\nThis is to view the changes between two arbitrary <commit>.\r\n\r\ngit diff [--options] <commit>..<commit> [--] [<path>…​]\r\nThis is synonymous to the previous form. If <commit> on one side is omitted, it will have the same effect as using HEAD instead.\r\n\r\ngit diff [--options] <commit>...<commit> [--] [<path>…​]\r\nThis form is to view the changes on the branch containing and up to the second <commit>, starting at a common ancestor of both <commit>. "git diff A...B" is equivalent to "git diff $(git-merge-base A B) B". You can omit any one of <commit>, which has the same effect as using HEAD instead.\r\nJust in case if you are doing something exotic, it should be noted that all of the <commit> in the above description, except in the last two forms that use ".." notations, can be any <tree>.\r\n\r\nFor a more complete list of ways to spell <commit>, see "SPECIFYING REVISIONS" section in gitrevisions(7). However, "diff" is about comparing two endpoints, not ranges, and the range notations ("<commit>..<commit>" and "<commit>...<commit>") do not mean a range as defined in the "SPECIFYING RANGES" section in gitrevisions(7).\r\n\r\ngit diff [options] <blob> <blob>\r\nThis form is to view the differences between the raw contents of two blob objects.', '2016-04-11 10:09:40', 5),
(3, 'Les branches avec Git - Brancher et fusionner : les bases', 'Brancher et fusionner : les bases\r\nSuivons un exemple simple de branche et fusion dans une utilisation que vous feriez dans le monde réel. Vous feriez les étapes suivantes :\r\n\r\ntravailler sur un site web ;\r\ncréer une branche pour un nouvel article sur lequel vous souhaiteriez travailler ;\r\nréaliser quelques tâches sur cette branche.\r\nÀ cette étape, vous recevez un appel pour vous dire qu''un problème critique a été découvert et qu''il faut le régler au plus tôt. Vous feriez ce qui suit :\r\n\r\nrevenir à la branche de production ;\r\ncréer une branche et y développer le correctif ;\r\naprès un test, fusionner la branche de correctif et pousser le résultat à la production ;\r\nrebasculer à la branche initiale et continuer le travail.', '2016-04-11 10:10:09', 1);





--
-- Vider la table avant d'insérer `rubrique`
--

TRUNCATE TABLE `rubrique`;
--
-- Contenu de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `lintitule`) VALUES
(2, 'Deux'),
(3, 'Trois'),
(1, 'Une');



--
-- Vider la table avant d'insérer `article_has_rubrique`
--

TRUNCATE TABLE `article_has_rubrique`;
--
-- Contenu de la table `article_has_rubrique`
--

INSERT INTO `article_has_rubrique` (`article_id`, `rubrique_id`) VALUES
(1, 1),
(3, 1),
(1, 2),
(2, 3),
(3, 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
