PORTNAME=	limine
DISTVERSION=	10.5.0
CATEGORIES=	sysutils
MASTER_SITES=	https://codeberg.org/Limine/Limine/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern, advanced, portable, multiprotocol bootloader and boot manager
WWW=		https://limine-bootloader.org/

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	mtools:filesystems/mtools \
		nasm:devel/nasm

USES=		gmake
GNU_CONFIGURE=	yes

CONFIGURE_ARGS=	--enable-all --disable-uefi-loongarch64
MAKEFILE=	GNUmakefile

INSTALL_TARGET=	install-strip

PORTDOCS=	3RDPARTY.md CONFIG.md FAQ.md USAGE.md

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e '/COPYING/d; /LICENSES/d' ${WRKSRC}/GNUmakefile.in

.include <bsd.port.mk>
