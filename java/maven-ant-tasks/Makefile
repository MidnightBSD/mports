PORTNAME=	maven-ant-tasks
PORTVERSION=	2.1.3
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	maven/binaries
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows Maven's artifact handling to be used from within an Ant build

LICENSE=	Apache-2.0

RUN_DEPENDS=	ant:devel/apache-ant

USES=		java

NO_BUILD=	yes

PLIST_FILES=	%%JAVASHAREDIR%%/apache-ant/lib/${DISTNAME}${EXTRACT_SUFX}

do-install:
	${MKDIR} ${JAVASHAREDIR}/apache-ant/lib/
	@${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} \
		${JAVASHAREDIR}/apache-ant/lib/

.include <bsd.port.mk>
