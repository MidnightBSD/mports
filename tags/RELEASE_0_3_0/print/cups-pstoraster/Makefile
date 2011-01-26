# New ports collection makefile for:	cups-pstoraster
# Date created:		Jul 13 2002
# Whom:			ports@FreeBSD.org
#
# $MidnightBSD: mports/print/cups-pstoraster/Makefile,v 1.4 2008/03/21 05:38:34 ctriv Exp $
# $FreeBSD: ports/print/cups-pstoraster/Makefile,v 1.25 2006/12/28 19:00:15 itetcu Exp $
#

PORTNAME=	cups-pstoraster
PORTVERSION=	8.15.4
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_EASYSW}
MASTER_SITE_SUBDIR=	ghostscript/${PORTVERSION}
DISTNAME=	espgs-${ESPGS_VER}-source
DIST_SUBDIR=	ghostscript

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Postscript interpreter for CUPS printing to non-PS printers
LICENSE=	gpl2

LIB_DEPENDS=	cups.2:${PORTSDIR}/print/cups-base

ESPGS_VER=	${PORTVERSION}
GS_VERSION=	8.15

DESTDIRNAME=	install_prefix

WRKSRC=		${WRKDIR}/espgs-${PORTVERSION}

DATADIR=	${PREFIX}/share/espgs

USE_BZIP2=	yes
USE_GMAKE=	yes
# We just need the ghostscript fonts, nothing more
USE_GHOSTSCRIPT_RUN=	yes
GNU_CONFIGURE=		yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=		CPPFLAGS="-I${LOCALBASE}/include" \
			LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--without-x --with-gs=espgs
MAKE_ARGS=	CFLAGS_STANDARD="${CFLAGS} -DUPD_SIGNAL=0" \
		DEVICE_DEVS="\$$(DD)cups.dev \$$(DD)pxlcolor.dev \$$(DD)pxlmono.dev"
PLIST_SUB=	GS_VERSION="${GS_VERSION}"

pre-configure:
	${RM} -f ${WRKSRC}/ijs/config.guess ${WRKSRC}/ijs/missing ${WRKSRC}/ijs/config.sub ${WRKSRC}/ijs/install-sh ${WRKSRC}/ijs/ltmain.sh
	${RM} -f ${WRKSRC}/trunk/ijs/config.guess ${WRKSRC}/trunk/ijs/missing ${WRKSRC}/trunk/ijs/config.sub ${WRKSRC}/trunk/ijs/install-sh ${WRKSRC}/trunk/ijs/ltmain.sh

post-patch:
	${LN} -sf ${WRKSRC}/pstoraster/gdevcups.c ${WRKSRC}/src
	${CAT} ${FILESDIR}/cups.contrib.mak >> ${WRKSRC}/src/contrib.mak
.for file in pstopxl pstoraster
	${REINPLACE_CMD} -e 's:@prefix@:${PREFIX}:g ; \
		 s:@exec_prefix@:${PREFIX}:g ; \
		 s:@bindir@:${PREFIX}/bin:g ; \
		 s:@GS@:espgs:g ; \
		 s|^GS_LIB="|GS_LIB="${PREFIX}/share/ghostscript/fonts:|' \
		 ${WRKSRC}/pstoraster/${file}.in
.endfor
	${REINPLACE_CMD} -e 's|^CFLAGS=|CFLAGS=@CPPFLAGS@ |g ; \
		 s|^LDFLAGS=|LDFLAGS=@LDFLAGS@ |g ; \
		 s|^DEVICE_DEVS|#DEVICE_DEVS|g ; \
		 s|^gssharedir = @libdir@/ghostscript|gssharedir = @libdir@/espgs| ; \
		 s|^gsdir = @datadir@/ghostscript|gsdir = @datadir@/espgs|' \
		 ${WRKSRC}/Makefile.in

pre-build:
	${MKDIR} ${WRKSRC}/bin
	${MKDIR} ${WRKSRC}/obj

.include <bsd.port.mk>
