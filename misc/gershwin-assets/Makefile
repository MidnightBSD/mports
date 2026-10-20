PORTNAME=	gershwin-assets
DISTVERSION=	20260129
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gershwin desktop assets including fonts and wallpapers
WWW=		https://github.com/gershwin-desktop/gershwin-assets

LICENSE=	OFL11 agpl BH
LICENSE_COMB=	multi
LICENSE_NAME_BH=	Bigelow & Holmes Luxi font license
LICENSE_FILE_BH=	${WRKSRC}/Library/Fonts/Luxi/COPYRIGHT.BH
LICENSE_FILE_OFL11=	${WRKSRC}/Library/Fonts/Inter/LICENSE.txt
LICENSE_FILE_agpl=	${WRKSRC}/Library/Fonts/URW/COPYING
LICENSE_PERMS_BH=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	gershwin-tools-make>0:devel/gershwin-tools-make

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	gershwin-desktop
GH_TAGNAME=	9266b6e

NO_ARCH=	yes
NO_MTREE=	yes
NO_BUILD=	yes

do-install:
	cd ${WRKSRC} && ${GMAKE} -f GNUmakefile DESTDIR=${FAKE_DESTDIR} install

post-install:
	@${SED} -i '' 's|${FAKE_DESTDIR}||g' ${FAKE_DESTDIR}/System/Library/Receipts/Assets.stamp

.include <bsd.port.mk>
