# $MidnightBSD$
# $FreeBSD: head/devel/liblangtag/Makefile 393959 2015-08-11 18:31:18Z jkim $

PORTNAME=	liblangtag
PORTVERSION=	0.5.7
CATEGORIES=	devel textproc
MASTER_SITES=	https://bitbucket.org/tagoh/liblangtag/downloads/ \
		FREEBSD_LOCAL/jkim

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interface library to access tags for identifying languages

LICENSE=	lgpl3 mpl
LICENSE_COMB=	dual

LIB_DEPENDS=	libxml2.so:${PORTSDIR}/textproc/libxml2

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		gmake iconv libtool pathfix pkgconfig tar:bzip2
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--disable-introspection

.include <bsd.port.mk>
