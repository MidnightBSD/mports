# $MidnightBSD: mports/finance/kmymoney2/Makefile,v 1.3 2011/01/14 14:45:51 laffer1 Exp $
# $FreeBSD: ports/finance/kmymoney2/Makefile,v 1.17 2007/10/04 00:50:27 edwin Exp $

PORTNAME=	kmymoney2
PORTVERSION=	0.8.7
PORTREVISION=	1
CATEGORIES=	finance
MASTER_SITES=	SF/${PORTNAME}/KMyMoney/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE-based personal finance assistant
LICENSE=	gpl2

LIB_DEPENDS=	osp.5:${PORTSDIR}/textproc/opensp
BUILD_DEPENDS=	${LOCALBASE}/bin/bash:${PORTSDIR}/shells/bash

# Currently no possibility to enable OFX; requires additional work
.undef WITH_OFX
WITHOUT_OFX=	yes

.if defined(WITH_OFX)
LIB_DEPENDS+=	ofx.3:${PORTSDIR}/finance/libofx
CONFIGURE_ARGS=	--enable-ofxplugin
OFXPLUGIN=
.else
CONFIGURE_ARGS=	--enable-ofxplugin=no
OFXPLUGIN=	"@comment "
.endif

PLIST_SUB+=	OFXPLUGIN=${OFXPLUGIN}

USE_KDELIBS_VER=	3
USE_GMAKE=		yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_PERL5=		yes
USE_BZIP2=		yes
USE_LDCONFIG=	yes
USE_GETTEXT=	yes

INSTALLS_ICONS=	yes

MAN1=			kmymoney2.1
MANCOMPRESSED=	yes

DATADIR=		${PREFIX}/share/apps/${PORTNAME}
DOCSDIR=		${PREFIX}/share/doc/HTML/en/${PORTNAME}

post-patch:
	${REINPLACE_CMD} -E -e "s|%%LOCALBASE%%|${LOCALBASE}|g" ${WRKSRC}/configure

.include <bsd.port.mk>
