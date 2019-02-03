# Created by: stas@FreeBSD.org
# $FreeBSD: head/devel/libunwind/Makefile 460139 2018-01-27 18:42:50Z sunpoet $
# $MidnightBSD$

PORTNAME=	libunwind
PORTVERSION=	20170615	# This is the release date of libunwind 1.2.1
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SAVANNAH
DISTNAME=	${PORTNAME}-1.2.1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic stack unwinding library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes
DOCS_CONFIGURE_ON=	ac_cv_path_LATEX2MAN=${TRUE}
DOCS_CONFIGURE_OFF=	--disable-documentation

ONLY_FOR_ARCHS=	aarch64 i386 amd64

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes
USES=		libtool pathfix pkgconfig
LLD_UNSAFE=	yes

PLIST_SUB=	ARCH=${ARCH:S|i386|x86|:S|amd64|x86_64|}

.include <bsd.port.mk>
