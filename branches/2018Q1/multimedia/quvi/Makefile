# Created by: Toni Gundogdu <legatvs@gmail.com>
# $MidnightBSD$

PORTNAME=	quvi
PORTVERSION=	0.4.2
CATEGORIES=	multimedia devel
MASTER_SITES=	SF/${PORTNAME}/${PORTVERSION:R}/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line tool for parsing flash media stream URLs

LICENSE=	lgpl2.1 lgpl3
LICENSE_COMB=	dual

BUILD_DEPENDS=	libquvi>=0.4.0:${PORTSDIR}/multimedia/libquvi
LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl
RUN_DEPENDS:=	${BUILD_DEPENDS}

GNU_CONFIGURE=	yes
USES=		pkgconfig tar:xz

PLIST_FILES=	bin/quvi \
		man/man1/quvi.1.gz

.include <bsd.port.mk>
