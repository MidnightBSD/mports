PORTNAME=	jmtpfs
DISTVERSION=	g20190420
CATEGORIES=	sysutils
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MTP device filesystem
WWW=		https://github.com/kiorky/jmtpfs

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libmtp.so:multimedia/libmtp

USE_GITHUB=	yes
GH_ACCOUNT=	kiorky
GH_TAGNAME=	af0b79bc555ee60088306fdd2b78b2d51b781da3

USES=		autoreconf compiler:c++11-lib fuse pkgconfig
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	AUTHORS NEWS README.rst

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \
		"${PORTDOCS}" ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
