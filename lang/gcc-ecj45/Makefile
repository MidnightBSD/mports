PORTNAME=	gcc-ecj
PORTVERSION=	4.5
CATEGORIES=	lang java
MASTER_SITES=	${MASTER_SITE_SOURCEWARE}
MASTER_SITE_SUBDIR+=	java/
DISTNAME=	ecj-${PORTVERSION}.jar
EXTRACT_SUFX=
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Eclipse Java Compiler used to build GCC Java

LICENSE=	epl

NO_BUILD=	yes
PLIST_FILES=	share/java/${DISTNAME}

do-install:
	${INSTALL_DATA} ${DISTDIR}/${DISTNAME} ${PREFIX}/share/java/

.include <bsd.port.mk>
