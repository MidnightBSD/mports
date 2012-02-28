# $MidnightBSD$
# $FreeBSD: ports/devel/maven-ant-tasks/Makefile,v 1.8 2012/01/09 15:40:56 tabthorpe Exp $

PORTNAME=	maven-ant-tasks
PORTVERSION=	2.1.3
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	maven/binaries
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allows Maven's artifact handling to be used from within an Ant build
LICENSE=	apache2

RUN_DEPENDS=	ant:${PORTSDIR}/devel/apache-ant

USE_JAVA=	1.5+

NO_BUILD=	yes

PLIST_FILES=	%%JAVASHAREDIR%%/apache-ant/lib/${DISTNAME}${EXTRACT_SUFX}

do-install:
	@${INSTALL_DATA} ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} \
		${JAVASHAREDIR}/apache-ant/lib/

.include <bsd.port.mk>
