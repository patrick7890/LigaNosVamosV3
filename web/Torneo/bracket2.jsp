<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <!--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">-->
    <link href="../Recursos/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
    <link href='https://fonts.googleapis.com/css?family=Holtwood+One+SC' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script|Herr+Von+Muellerhoff' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Istok+Web|Roboto+Condensed:700' rel='stylesheet' type='text/css'>
    <link href="bracket.css" rel="stylesheet" type="text/css">
    <title>March Madness Stock Matchup</title>
</head>
<body>

    <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                       user = "juan"  password = "123456"/>

    <sql:query var="Liga" dataSource="${nosvamos}">
        SELECT nombre_liga,lugar ,ganador, DATE_FORMAT(fecha_inicio,'%Y') AS anio FROM liga where liga_id='${idliga}'
    </sql:query>
    <sql:query var="fechas" dataSource="${nosvamos}">
        SELECT 
        DISTINCT(fecha_match)
        ,liga_id
        ,DATE_FORMAT(fecha_match,'%M %W %d') AS fecha
        FROM `match` 
        JOIN liga l on l.liga_id=match.liga_liga_id 
        WHERE liga_liga_id='${idliga}' 
    </sql:query>
    <header class="hero">
        <div class="hero-wrap">
            <c:forEach var="list" items="${Liga.rows}">
                <p class="intro" id="intro"><c:out value="${list.nombre_liga}"/></p>
                <h1 id="headline">Tournament</h1>
                <p class="year"><i class="fas fa-star"></i> ${list.anio} <i class="fas fa-star"></i></p>
                <p>${list.lugar}</p>
            </c:forEach>
        </div>
    </header>
    <style>
        body {font-family: 'Istok Web', sans-serif;background: url("http://picjumbo.com/wp-content/uploads/HNCK2189-1300x866.jpg") no-repeat #000;background-size: cover;min-height: 100%;margin: 0;}
        .hero {position:relative; text-align: center; overflow: hidden; color: #fcfcfc; }
        .hero h1 {font-family: 'Holtwood One SC', serif;font-weight: normal;font-size: 5.4em;margin:0 0 20px; text-shadow:0 0 12px rgba(0, 0, 0, 0.5);text-transform: uppercase;letter-spacing:-1px;}
        .hero p {font-family: 'Abel', sans-serif;text-transform: uppercase; color: #5CCA87; letter-spacing: 6px;text-shadow:0 0 12px rgba(0, 0, 0, 0.5);font-size: 1.2em;}
        .hero-wrap {padding: 3.5em 10px;}
        .hero p.intro {font-family: 'Holtwood One SC', serif;text-transform: uppercase;letter-spacing: 1px;font-size: 3em;margin-bottom:-40px;}
        .hero p.year {color: #fff; letter-spacing: 20px; font-size: 34px; margin: -25px 0 25px;}
        .hero p.year i {font-size: 14px;vertical-align: middle;}
        #bracket {
            overflow:hidden;background-color: #e1e1e1;
            background-color:rgba(225,225,225,0.9);
            padding-top: 20px;font-size: 12px;padding: 40px 0;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
            display:block;
            display: -webkit-box;display: -moz-box;
            display: -ms-flexbox;display: -webkit-flex;
            display: -webkit-flex;
            display: flex;
            -webkit-flex-direction:row;
            flex-direction: row;
        }
        .split {
            display:block;float:left;display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;display: -webkit-flex;
            display:flex;
            width: 42%;
            -webkit-flex-direction:row;
            -moz-flex-direction:row;
            flex-direction:row;
        }
        .champion {
            float:left;display:block;width: 16%;
            -webkit-flex-direction:row;flex-direction:row;
            -webkit-align-self:center;align-self:center;
            margin-top: -15px;text-align: center;padding: 230px 0\9;
        } 
        .champion i {
            color: #a0a6a8; 
            font-size: 45px;
            padding: 10px 0; }
        .round {
            display:block;
            float:left;
            display:-webkit-box;
            display: -moz-box;
            display:-ms-flexbox;
            display:-webkit-flex;
            display:flex;
            -webkit-flex-direction:column;
            flex-direction:column;
            width:95%;width:30.8333%\9;
        }
        .split-two {}
        .split-one .round {margin: 0 2.5% 0 0;}
        .split-two .round {margin: 0 0 0 2.5%;}
        .matchup {margin:0;width: 100%;padding: 10px 0;height:60px;-webkit-transition: all 0.2s;transition: all 0.2s;}
        .score {font-size: 11px;text-transform: uppercase;float: right;color: #2C7399;font-weight: bold;font-family: 'Roboto Condensed', sans-serif;position: absolute;right: 5px;}
        .team {padding: 0 5px;margin: 3px 0;height: 25px; line-height: 25px;white-space: nowrap; overflow: hidden;position: relative;}
        .round-two .matchup {margin:0; height: 60px;padding: 50px 0;}
        .round-three .matchup {margin:0; height: 60px; padding: 130px 0;}
        .round-details {font-family: 'Roboto Condensed', sans-serif; font-size: 13px; color: #2C7399;text-transform: uppercase;text-align: center;height: 40px;}
        .champion li, .round li {background-color: #fff;box-shadow: none; opacity: 0.45;}
        .current li {opacity: 1;}
        .current li.team {background-color: #fff;box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);opacity: 1;}
        .vote-options {display: block;height: 52px;}
        .share .container {margin: 0 auto; text-align: center;}
        .share-icon {font-size: 24px; color: #fff;padding: 25px;}
        .share-wrap {max-width: 1100px; text-align: center; margin: 60px auto;}
        .final {margin: 4.5em 0;}

        @-webkit-keyframes pulse {
            0% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }

            50% {
                -webkit-transform: scale(1.3);
                transform: scale(1.3);
            }

            100% {
                -webkit-transform: scale(1);
                transform: scale(1);
            }
        }

        @keyframes pulse {
            0% {
                -webkit-transform: scale(1);
                -ms-transform: scale(1);
                transform: scale(1);
            }

            50% {
                -webkit-transform: scale(1.3);
                -ms-transform: scale(1.3);
                transform: scale(1.3);
            }

            100% {
                -webkit-transform: scale(1);
                -ms-transform: scale(1);
                transform: scale(1);
            }
        }

        .share-icon {color: #fff; opacity: 0.35; }
        .share-icon:hover { opacity:1;  -webkit-animation: pulse 0.5s; animation: pulse 0.5s;}
        .date {font-size: 10px; letter-spacing: 2px;font-family: 'Istok Web', sans-serif;color:#3F915F;}



        @media screen and (min-width: 981px) and (max-width: 1099px) {
            .container {margin: 0 1%;}
            .champion {width: 14%;}
            .split {width:43%; }
            .split-one .vote-box {margin-left: 138px;}
            .hero p.intro {font-size: 28px;}
            .hero p.year {margin: 5px 0 10px;}

        }

        @media screen and (max-width: 980px) {
            .container {-webkit-flex-direction:column;-moz-flex-direction:column;flex-direction:column;}
            .split, .champion {width: 90%;margin: 35px 5%;}
            .champion {-webkit-box-ordinal-group:3;-moz-box-ordinal-group:3;-ms-flex-order:3;-webkit-order:3;order:3;}
            .split {border-bottom: 1px solid #b6b6b6; padding-bottom: 20px;}
            .hero p.intro {font-size: 24px;}
            .hero h1 {font-size: 3em; margin: 15px 0;}
            .hero p {font-size: 1em;}
        }


        @media screen and (max-width: 400px) {

            .split {width: 95%;margin: 25px 2.5%;}
            .round {width:21%;}
            .current {-webkit-flex-grow:1;-moz-flex-grow:1;flex-grow:1;}
            .hero h1 {font-size: 2.15em; letter-spacing: 0;margin:0; }
            .hero p.intro {font-size: 1.15em;margin-bottom: -10px;}
            .round-details {font-size: 90%;}
            .hero-wrap {padding: 2.5em;}
            .hero p.year {margin: 5px 0 10px; font-size: 18px;}

        }
    </style>
    <section id="bracket">
        <div class="container">
            <div class="split split-one">
                <c:forEach var="f" items="${fechas.rows}" varStatus="loop">
                    <sql:query var="result" dataSource="${nosvamos}">
                        SELECT l.nombre_liga,
                        GROUP_CONCAT(e.nombre_equipo) AS "equipos",
                        m.match
                        FROM `match` AS m JOIN equipo AS e on m.equipo_equipo_id=e.equipo_id 
                        JOIN liga l on l.liga_id=m.liga_liga_id 
                        WHERE m.liga_liga_id='${f.liga_id}' and m.fecha_match='${f.fecha_match}'
                        GROUP by m.fecha_match, m.match
                    </sql:query>
                    <c:choose>
                        <c:when test="${loop.count==1}">
                            <div class="round round-one current">
                                <div class="round-details">Ronda 1<br/><span class="date">${f.fecha}</span></div>
                                    <c:forEach var="list" items="${result.rows}" end="7" varStatus="r1">
                                    <ul class="matchup">
                                        <li class="team team-top"><c:out value="${fn:substringBefore(list.equipos, ',')}"/> </li>
                                        <li class="team team-bottom"><c:out value="${fn:substringAfter(list.equipos, ',')}"/></li>
                                    </ul>
                                </c:forEach>
                            </c:when>
                            <c:when test="${loop.count==2}">
                                <div class="round round round-two current" >
                                    <div class="round-details">Ronda 2<br/><span class="date">${f.fecha}</span></div>
                                        <c:forEach var="list" items="${result.rows}"end="3" varStatus="r2">
                                            
                                        <ul class="matchup">
                                            <li class="team team-top"><c:out value="${fn:substringBefore(list.equipos, ',')}"/> </li>
                                            <li class="team team-bottom"><c:out value="${fn:substringAfter(list.equipos, ',')}"/></li>
                                        </ul>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${loop.count==3}">

                                    <div class="round round-three current">
                                        <div class="round-details">Ronda 3<br/><span class="date">${f.fecha}</span></div>
                                            <c:forEach var="list" items="${result.rows}" end="1" varStatus="r3"> 
                                            <ul class="matchup">
                                                <li class="team team-top"><c:out value="${fn:substringBefore(list.equipos, ',')}"/></li>
                                                <li class="team team-bottom"><c:out value="${fn:substringAfter(list.equipos, ',')}"/></li>
                                            </ul>
                                        </c:forEach>

                                    </c:when>
                                    <c:when test="${loop.count==4}">
                                    </div>
                                    <div class="champion">
                                        <div class="final current">
                                            <div class="round-details">Campionato <br/><span class="date">${f.fecha}</span></div>		
                                                <c:forEach var="list" items="${result.rows}">
                                                <ul class="matchup champion">
                                                    <li class="team team-top"><c:out value="${fn:substringBefore(list.equipos, ',')}"/> </li>
                                                    <li class="team team-bottom"><c:out value="${fn:substringAfter(list.equipos, ',')}"/></li>
                                                </ul>
                                            </c:forEach>
                                        </c:when>
                                    </c:choose>
                                </div> 
                            </c:forEach>
                        </div>
                        <c:forEach var="l" items="${Liga.rows}"> 
                            <c:if test="${l.ganador!=null}">
                                <div class="split split-two" style="margin-left: 10px">
                                    <div class="champion">                                            
                                        <div class="final current">
                                            <i class="fas fa-trophy"></i>
                                            <div class="round-details "><h2>Campion</h2></div>						
                                            <ul class="matchup">
                                                <li class="team team-top"><c:out value="${l.ganador}"/> </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>	

                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="share">
        <div class="share-wrap">
            <a class="share-icon" href="https://twitter.com/basement47"><i class="fab fa-twitter"></i></a>
            <a class="share-icon" href="#"><i class="fab fa-facebook"></i></a>
            <a class="share-icon" href="#"><i class="fas fa-envelope"></i></a>
        </div>
    </section>