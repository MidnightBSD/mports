PORTNAME=	simple-mtpfs
DISTVERSIONPREFIX=	v
DISTVERSION=	0.4.0
PORTREVISION=	1
CATEGORIES=	filesystems
PKGNAMEPREFIX=	fusefs-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple MTP fuse filesystem driver
WWW=		https://github.com/phatina/simple-mtpfs

LICENSE=	gpl2+

BUILD_DEPENDS=	autoconf-archive>0.2017:devel/autoconf-archive
LIB_DEPENDS=	libmtp.so:multimedia/libmtp

USE_GITHUB=	yes
GH_ACCOUNT=	phatina

USES=		autoreconf compiler:c++17-lang fuse localbase pkgconfig
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
MAKEFILE=	makefile
INSTALL_TARGET=	install-strip
PLIST_FILES=	bin/${PORTNAME} \
		share/man/man1/${PORTNAME}.1.gz
PORTDOCS=	AUTHORS NEWS README.md

OPTIONS_DEFINE=	DOCS

# XXX move to PREFIX when bug 193596 lands
.if exists(/etc/autofs)
PLIST_FILES+=	/etc/autofs/special_${PORTNAME}
SUB_FILES+=	special_${PORTNAME}
.endif

post-install:
	(cd ${WRKSRC} && ${COPYTREE_SHARE} \
		"${PORTDOCS}" ${DOCSDIR})
.if exists(/etc/autofs)
	@${MKDIR} ${FAKE_DESTDIR}/etc/autofs
	${INSTALL_SCRIPT} ${WRKDIR}/special_${PORTNAME} \
		${FAKE_DESTDIR}/etc/autofs
.endif

.include <bsd.port.mk>
