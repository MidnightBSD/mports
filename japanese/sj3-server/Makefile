PORTNAME=	sj3
PORTVERSION=	2.0.1.20
PORTREVISION=	10
CATEGORIES=	japanese
MASTER_SITES=	FREEBSD_LOCAL/nork
PKGNAMESUFFIX=	-server

PATCH_SITES=	http://quasiquote.org/files/
PATCHFILES=	${PORTNAME}-qq-2.0.1.21.diff.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese input method, binary part

LICENSE=	mit
LICENSE_FILE=	${FILESDIR}/COPYING

LIB_DEPENDS=	libsj3lib.so:japanese/sj3-lib

USES=		imake
USE_RC_SUBR=	sj3

CFLAGS+=	-Wno-return-type -fcommon

SUB_FILES=	sj3_freebsd.tmpl
SUB_LIST=	DESTDIR=${DESTDIR}

USERS=		_sj3
GROUPS=		_sj3

PLIST_SUB=	USERS=${USERS} GROUPS=${GROUPS}
PORTDOCS=	Nihongo.ps.Z hinsi.ms makedict.ms sj3lib.ms sj3serv.ms

OPTIONS_DEFINE=	DOCS

POSTPATCHES=	${FILESDIR}/post-patch-Imakefile \
		${FILESDIR}/post-patch-sj3lib-Imakefile \
		${FILESDIR}/post-patch-sj3-sj3.c \
		${FILESDIR}/post-patch-dict-dict-Imakefile \
		${FILESDIR}/post-patch-include-Const.h \
		${FILESDIR}/post-patch-server-setup.c \
		${FILESDIR}/post-patch-server-serverrc \
		${FILESDIR}/post-patch-server-sj3serv.h \
		${FILESDIR}/post-patch-server-comuni.c
POSTPATCHES.nodocports= \
		${FILESDIR}/post-patch-doc-doc-Imakefile.nodocports

.include <bsd.port.pre.mk>

CFLAGS+=	-Wno-error=int-conversion
CFLAGS+=	-Wno-error=incompatible-function-pointer-types

post-patch:
	cd ${WRKSRC} && ${CAT} ${POSTPATCHES} | ${PATCH}
	${REINPLACE_CMD} 's|/man/|/share/man/|' ${WRKSRC}/doc/man/Imakefile

post-patch-DOCS-off:
	cd ${WRKSRC} && ${CAT} ${POSTPATCHES.nodocports} | ${PATCH}

pre-configure:
	${INSTALL_DATA} ${WRKDIR}/sj3_freebsd.tmpl ${WRKSRC}/sj3_freebsd.tmpl

post-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/sj3/dict/user

.include <bsd.port.post.mk>
