# $FreeBSD: ports/textproc/libwpd/Makefile,v 1.18 2006/02/23 10:39:24 ade Exp $
# $MidnightBSD$

PORTNAME=	libwpd
PORTVERSION=	0.9.9
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools for importing and exporting WordPerfect(tm) documents

LICENSE=	lgpl2.1 mpl
LICENSE_COMB=	dual

USES=		pathfix libtool:keepla tar:bzip2
GNU_CONFIGURE=	yes
USE_GNOME=	libgsf
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS=	--without-docs
PLIST_SUB=	MAJVER=${PORTVERSION:R}

post-install:
	@${RM} ${PREFIX}/bin/wpd*

.include <bsd.port.mk>
