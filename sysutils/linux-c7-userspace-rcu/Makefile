PORTNAME=	userspace-rcu
PORTVERSION=	0.7.16
DISTVERSIONSUFFIX=	-1.el7
CATEGORIES=	sysutils linux
MASTER_SITES=	EPEL7/u

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Userspace read-copy-update (RCU) data synchronization library (CentOS ${LINUX_DIST_VER})
WWW=		https://liburcu.org/

LICENSE=	lgpl2.1+

ONLY_FOR_ARCHS=	aarch64 amd64

USES=		linux:c7
USE_LDCONFIG=	yes
USE_LINUX_RPM=	nolib

DESCR=		${.CURDIR}/../liburcu/pkg-descr

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
