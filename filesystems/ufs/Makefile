PORTNAME=	ufs
DISTVERSION=	0.4.3
CATEGORIES=	filesystems sysutils
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FUSE driver for FreeBSD's UFSv2
WWW=		https://github.com/realchonk/fuse-ufs

# dependencies are all MIT licensed
LICENSE=	bsd2 mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE.md

USES=		cargo fuse:3
USE_GITHUB=	yes
GH_ACCOUNT=	realchonk
GH_PROJECT=	fuse-ufs
CARGO_INSTALL_PATH=	fuse-ufs

post-install:
	${INSTALL_MAN} ${WRKSRC}/docs/fuse-ufs.8 ${STAGEDIR}${PREFIX}/share/man/man8/
	${LN} ${STAGEDIR}${PREFIX}/bin/fuse-ufs ${STAGEDIR}${PREFIX}/bin/mount.ufs

.include <bsd.port.mk>
