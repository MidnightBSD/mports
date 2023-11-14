PORTNAME=	libepoll-shim
DISTVERSIONPREFIX=	v
DISTVERSION=	0.0.20230411
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small epoll implementation using kqueue
WWW=		https://github.com/jiixyj/epoll-shim

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c11
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	jiixyj
GH_PROJECT=	epoll-shim
PLIST_SUB=	SHIM_EVENTFD="${exists(/usr/include/sys/eventfd.h):?@comment :}" \
	SHIM_TIMERFD="${exists(/usr/include/sys/timerfd.h):?@comment :}"

NO_TEST=	yes

.include <bsd.port.mk>
