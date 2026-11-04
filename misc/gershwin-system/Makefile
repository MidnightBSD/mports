PORTNAME=	gershwin-system
DISTVERSION=	20260129
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gershwin global defaults for GNUstep under /System
WWW=		https://github.com/gershwin-desktop/gershwin-system

LICENSE=	bsd2

BUILD_DEPENDS=	gershwin-tools-make>0:devel/gershwin-tools-make

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	gershwin-desktop
GH_TAGNAME=	a016dc7

NO_ARCH=	yes
NO_MTREE=	yes
NO_BUILD=	yes

do-install:
	cd ${WRKSRC} && ${GMAKE} -f GNUmakefile DESTDIR=${FAKE_DESTDIR} install

# GNUstep.conf belongs to devel/gershwin-tools-make; the receipt only serves
# upstream's "make uninstall".
post-install:
	${RM} ${FAKE_DESTDIR}/System/Library/Preferences/GNUstep.conf \
		${FAKE_DESTDIR}/System/Library/Receipts/System.stamp
	${RMDIR} ${FAKE_DESTDIR}/System/Library/Receipts

.include <bsd.port.mk>
