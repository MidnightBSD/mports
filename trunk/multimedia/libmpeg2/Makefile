# New ports collection makefile for:	libmpeg2
# Date created:		Tue Oct 16 17:14:20 BRST 2001
# Whom:                 Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $FreeBSD: ports/multimedia/libmpeg2/Makefile,v 1.32 2006/09/21 08:07:58 stas Exp $
# $MidnightBSD: mports/multimedia/libmpeg2/Makefile,v 1.3 2008/08/13 19:17:08 laffer1 Exp $
#

PORTNAME=	libmpeg2
PORTVERSION=	0.4.1
PORTREVISION=	0
CATEGORIES=	multimedia
MASTER_SITES=	http://libmpeg2.sourceforge.net/files/
DISTNAME=	mpeg2dec-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A free library for decoding mpeg-2 and mpeg-1 video streams
LICENSE=	gpl2

USE_GNOME=	gnometarget
USE_AUTOTOOLS=	libtool:22
USE_LDCONFIG=	yes

CONFIGURE_ARGS=	--enable-shared \
		--with-x

MAN1=	extract_mpeg2.1 mpeg2dec.1

PORTDOCS=	libmpeg2.txt README COPYING

OPTIONS=	SDL "Enable SDL support" off

.ifdef(WITH_SDL)
USE_SDL=	yes
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-libvo::configure.incl
CONFIGURE_ARGS+=	--enable-sdl
.else
CONFIGURE_ARGS+=	--disable-sdl
.endif

# allow build with more warnings enabled
.if defined(NO_WERROR)
CONFIGURE_ARGS+=	--disable-warnings
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|-O3||;s|<termio.h>|<termios.h>|' ${WRKSRC}/configure
# AMD64 prefers position independent code
.if ${ARCH:L} == "amd64"
	@${REINPLACE_CMD} -e 's|-prefer-non-pic||' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}
.endif
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/libmpeg2/Makefile.in
	@${REINPLACE_CMD} -e 's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/libmpeg2/convert/Makefile.in
post-install:
.ifndef(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/libmpeg2.txt ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/COPYING ${DOCSDIR}
.endif
	@${INSTALL_DATA} ${WRKSRC}/libvo/libvo.a ${PREFIX}/lib
	@${INSTALL_DATA} ${WRKSRC}/include/video_out.h \
		${PREFIX}/include/mpeg2dec

.include <bsd.port.post.mk>
