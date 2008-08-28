# New ports collection makefile for:	faac
# Date created:			Wed May  5 16:38:55 EDT 2004
# Whom:				Michael Johnson <ahze@ahze.net>
#
# $MidnightBSD: mports/audio/faac/Makefile,v 1.2 2008/02/25 00:44:51 laffer1 Exp $
# $FreeBSD: ports/audio/faac/Makefile,v 1.28 2006/09/02 23:41:40 kris Exp $
#

PORTNAME=	faac
PORTVERSION=	1.26
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE_EXTENDED}
MASTER_SITE_SUBDIR=	faac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio encoder
LICENSE=	restricted
# part lgpl, part not.. also patent issues

LIB_DEPENDS=	mp4v2.0:${PORTSDIR}/multimedia/mpeg4ip-libmp4v2

RESTRICTED=	Distribution in binary form is prohibited
WRKSRC=		${WRKDIR}/${PORTNAME}
USE_DOS2UNIX=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	automake:19 autoheader:261 libtool:15
AUTOMAKE_ARGS=	--add-missing
USE_GMAKE=	yes
USE_DOS2UNIX=	yes
CONFIGURE_TARGET=--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="-lmp4v2"

.include <bsd.port.pre.mk>

pre-configure:
	@${ECHO_CMD} "" >>${WRKSRC}/libfaac/psych.h
	@cd ${WRKSRC}; ${SETENV} ${AUTOMAKE_ENV} ${ACLOCAL} -I .; \
		${SETENV} ${SCRIPTS_ENV} ${LIBTOOLIZE} --automake

.include <bsd.port.post.mk>
