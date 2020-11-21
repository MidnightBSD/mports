# Created by: kamikaze@bsdforen.de

PORTNAME=	libbdplus
PORTVERSION=	0.1.2
CATEGORIES=	multimedia
MASTER_SITES=	ftp://ftp.videolan.org/pub/videolan/${PORTNAME}/${PORTVERSION}/ \
		http://blu.opsec.eu/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BD+ System research implementation

LICENSE=	lgpl2.1

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error

USE_LDCONFIG=	yes
USES=		autoreconf tar:bzip2 pkgconfig libtool

CONFIGURE_ARGS=	--without-libaacs

.include "${.CURDIR}/../libbluray/Makefile.include"

.include <bsd.port.mk>
