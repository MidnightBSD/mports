PORTNAME=	tk
PORTVERSION=	0.4.0
CATEGORIES=	x11-toolkits rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Ruby interface to TclTk-8.6
WWW=		https://github.com/ruby/tk

LICENSE=	bsd2

CONFIGURE_ARGS=--with-tcltkversion=8.6,8.6 \
		--with-tk-include=${LOCALBASE}/include/tk8.6 \
		--with-tcl-include=${LOCALBASE}/include/tcl8.6

USES=		gem tk:86 xorg
USE_XORG=	x11

.include <bsd.port.mk>
