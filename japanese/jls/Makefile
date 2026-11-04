PORTNAME=	ls
PORTVERSION=	0.5
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	http://www.angels.vg/bsd/
DISTNAME=	freebsd-ls.releng_4_9_0_release

PATCH_SITES=	${MASTER_SITES}
PATCHFILES=	j${PORTNAME}-${PORTVERSION}.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanized ls

LICENSE=	bsd4

CONFLICTS=	sleuthkit

FAKE_OPTS=	trueprefix

USES=		ncurses uidfix
PLIST_FILES=	bin/jls \
		share/man/man1/jls.1.gz

WRKSRC=	${WRKDIR}/ls

MAKE_ARGS=	MANDIR="${TRUE_PREFIX}/share/man/man"

.include <bsd.mport.options.mk>

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

pre-patch:
	(cd ${WRKSRC} && ${MV} ls.1 jls.1)

post-patch:
	@${REINPLACE_CMD} -e 's|-ltermcap|-lncurses|g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
