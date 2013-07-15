# $MidnightBSD: mports/editors/kile/Makefile,v 1.5 2011/02/02 20:19:25 laffer1 Exp $

PORTNAME=	kile
PORTVERSION=	2.0.3
PORTREVISION=	1
CATEGORIES=	editors kde
MASTER_SITES=	SF/${PORTNAME}/stable/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A LaTeX source editor for KDE

LICENSE=	gpl2

RUN_DEPENDS=	identify:${PORTSDIR}/graphics/ImageMagick

CONFLICTS=	kile-i18n-[0-9]*

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_TEX=	latex

OPTIONS_DEFINE=	KPDF
OPTIONS_DEFAULT=	KPDF
KPDF_DESC=	Use KPDF and KDVI for viewing

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's| syntax||g' ${WRKSRC}/src/kile/Makefile.in

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MKPDF}
RUN_DEPENDS+=	kpdf:${PORTSDIR}/graphics/kdegraphics3
.endif

.include <bsd.port.mk>
