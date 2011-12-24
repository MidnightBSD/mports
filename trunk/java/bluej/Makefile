# $MidnightBSD: mports/java/bluej/Makefile,v 1.4 2008/06/13 02:07:44 laffer1 Exp $
# $FreeBSD: ports/java/bluej/Makefile,v 1.18 2006/06/12 23:44:13 hq Exp $

PORTNAME=	bluej
PORTVERSION=	3.0.2
CATEGORIES=	java editors
MASTER_SITES=	http://www.bluej.org/download/files/ \
		ftp://ftp.bluej.org/pub/bluej/
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.//g}
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Integrated Java environment designed for introductory teaching
LICENSE=	restricted
# not for profit  distribution

RESTRICTED=	yes
NO_CDROM=	yes
IS_INTERACTIVE=	yes
NO_BUILD=	yes

USE_JAVA=	yes
JAVA_VERSION=	1.6+

do-install:
	@${ECHO} Starting BlueJ graphical installer...  Please install to default path of
	@${ECHO} ${PREFIX}/bluej.  Close the installer when done.
	@cd ${PREFIX}; ${JAVA_HOME}/bin/java -jar ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}
	-@${MKDIR} ${PREFIX}/bin
	@${LN} -sf ${PREFIX}/bluej/bluej ${PREFIX}/bin/bluej
	${REINPLACE_CMD} 's|${PREFIX}|${TRUE_PREFIX}|g' ${PREFIX}/bluej/bluej

.include <bsd.port.mk>
