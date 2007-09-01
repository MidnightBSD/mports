# New ports collection makefile for:	faad
# Date created:			8 January 2003
# Whom:				Sean McGovern <sean@sfarc.net>
#
# $MidnightBSD$
# $FreeBSD: ports/audio/faad/Makefile,v 1.43 2006/08/31 18:14:56 mezz Exp $
#

PORTNAME=	faad2
PORTVERSION=	2.5
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	faac

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPEG-2 and MPEG-4 AAC audio decoder

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_CDROM=	Restrictive copyright (do not sell for profit)

USE_DOS2UNIX=	yes
USE_AUTOTOOLS=	automake:15 autoheader:259 libtool:15
AUTOMAKE_ARGS=	--add-missing
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
USE_GETOPT_LONG=yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-drm
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|<stdint\.h>|<inttypes.h>|g' \
		${WRKSRC}/common/mp4ff/mp4ff_int_types.h

pre-configure:
	${MKDIR} ${WRKSRC}/plugins/bmp
	@cd ${WRKSRC}; ${ACLOCAL} -I ${ACLOCAL_DIR} -I .; \
		${SETENV} ${SCRIPTS_ENV} ${LIBTOOLIZE} --automake
	@${ECHO_CMD} "SUBDIRS = libfaad common frontend" > \
		${WRKSRC}/Makefile.am

.include <bsd.port.post.mk>
