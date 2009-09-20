# $MidnightBSD: mports/textproc/wv/Makefile,v 1.2 2008/06/29 23:01:41 laffer1 Exp $

PORTNAME=	wv
PORTVERSION=	1.2.4
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	wvware

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library and executables to access Microsoft Word files
LICENSE=	gpl2

LIB_DEPENDS=	wmf.2:${PORTSDIR}/graphics/libwmf
RUN_DEPENDS=	lynx:${PORTSDIR}/www/lynx

USE_GNOME=	gnometarget libgsf
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool:22
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--with-png=${LOCALBASE} \
		--with-libwmf=${LOCALBASE}
MAKEFILE=	GNUmakefile
MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"
USE_LDCONFIG=	yes

MAN1=	wvAbw.1 wvCleanLatex.1 wvDVI.1 wvHtml.1 wvLatex.1 wvMime.1 wvPDF.1 \
	wvPS.1 wvRTF.1 wvSummary.1 wvText.1 wvVersion.1 wvWare.1 wvWml.1
MLINKS=	wvWare.1 wvConvert.1

.include <bsd.port.mk>
