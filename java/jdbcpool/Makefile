# $MidnightBSD: mports/java/jdbcpool/Makefile,v 1.2 2009/05/22 23:58:01 laffer1 Exp $

PORTNAME=	jdbcpool
PORTVERSION=	0.99
PORTREVISION=	1
CATEGORIES=	java databases
MASTER_SITES=	http://www.bitmechanic.com/projects/jdbcpool/dist/

MAINTAINER=	java@MidnightBSD.org
COMMENT=	JDBC connection pool
LICENSE=	other

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	yes

PORTDOCS=	CHANGES LICENSE README
.if !defined(NOPORTDOCS)
PORTDOCS+=	javadoc
.endif

post-extract:
	@${FIND} ${WRKSRC} -name CVS -type dir | ${XARGS} ${RM} -rf

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.jar ${JAVAJARDIR}/${PORTNAME}.jar
	cd ${WRKSRC}/examples \
	  && ${FIND} . -type d -exec ${MKDIR} ${EXAMPLESDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${EXAMPLESDIR}/{} \;
	cd ${WRKSRC} \
	  && ${FIND} ${PORTDOCS} -type d -exec ${MKDIR} ${DOCSDIR}/{} \; \
	  && ${FIND} ${PORTDOCS} -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;

.include <bsd.port.mk>
