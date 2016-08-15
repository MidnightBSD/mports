# $FreeBSD: ports/x11-fonts/font-util/Makefile,v 1.1 2007/05/19 20:29:20 flz Exp $
# $MidnightBSD$

PORTNAME=	font-util
PORTVERSION=	1.3.1
MASTER_SITES=	XORG/individual/font

CATEGORIES=	x11-fonts

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create an index of X font files in a directory

LICENSE=	bsd3

USES=		pathfix tar:bzip2
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-fontrootdir=${PREFIX}/share/fonts

.include <bsd.port.mk>
