# Created by: Joe Horn <joehorn@gmail.com>

PORTNAME=	tuning-primer
PORTVERSION=	1.6.r1
CATEGORIES=	databases
MASTER_SITES=	http://launchpad.net/mysql-${PORTNAME}/trunk/1.6-r1/+download/
DISTNAME=	${PORTNAME}.sh
EXTRACT_SUFX=	# empty
DIST_SUBDIR=	${PORTNAME}/${DISTVERSION}
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MySQL performance tuning primer script

LICENSE=	gpl2

USES=		mysql
NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/${PORTNAME}

do-install:
	${INSTALL_SCRIPT} ${DISTDIR}/${DIST_SUBDIR}/${PORTNAME}.sh \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
