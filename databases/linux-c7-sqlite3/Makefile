# Created by: Piotr Kubaj <pkubaj@anongoth.pl>

PORTNAME=	sqlite
PORTVERSION=	3.7.17
DISTVERSIONSUFFIX=	-8.el7_7.1
PORTREVISION=	2
CATEGORIES=	databases linux

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that implements an embeddable SQL database engine (Linux CentOS ${LINUX_DIST_VER})

LICENSE=	publicdom

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	yes

CONFLICTS=	linux-c6-${PORTNAME}-[0-9]*
DESCR=		${.CURDIR}/../${PORTNAME}3/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
