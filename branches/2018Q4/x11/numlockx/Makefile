# Created by: Jean-Baptiste Quenot <jb.quenot@caraldi.com>
# $FreeBSD: head/x11/numlockx/Makefile 415057 2016-05-12 10:57:28Z amdmi3 $
# $MidnightBSD$

PORTNAME=	numlockx
PORTVERSION=	1.2
CATEGORIES=	x11
MASTER_SITES=	http://mirror.amdmi3.ru/distfiles/ \
		LOCAL/ehaupt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Turns on numlock in X

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		localbase
USE_XORG=	x11 xext xtst
GNU_CONFIGURE=	yes
MAKE_ARGS=	ACLOCAL="${TRUE}" AUTOCONF="${TRUE}" AUTOMAKE="${TRUE}" \
		AUTOHEADER="${TRUE}"

PLIST_FILES=	bin/numlockx

.include <bsd.port.mk>
