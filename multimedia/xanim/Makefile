PORTNAME=	xanim
PORTVERSION=	2.92.0
PORTREVISION=	5
CATEGORIES=	multimedia graphics
MASTER_SITES=	FREEBSD_LOCAL/dinoex
DISTNAME=	xanim2920
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${EXTRA_FILES}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Play most popular animation formats and show pictures
WWW=		https://web.archive.org/web/20230627070655/http://xanim.polter.net/

LICENSE=	xanim
LICENSE_NAME=	xanim
LICENSE_FILE=	${WRKSRC}/docs/Copyright
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

NO_CDROM=	Must be redistributed without fee

# clang's cpp destroys whitespace, particularly hard tabs in makefiles,
# which is fatal for imake.
USES=		imake xorg
USE_GCC=	yes
USE_CSTD=	gnu99
USE_XORG=	xext xt sm ice xext x11
MAKE_ARGS+=	-j 2 # safe and helps even the single-CPU machines
DLLDIR=		${PREFIX}/lib/X11/xanim
PLIST_FILES+=	bin/xanim share/man/man1/xanim.1.gz

post-extract:
	${CP} ${WRKSRC}/docs/xanim.man ${WRKSRC}

.include <bsd.port.pre.mk>

.if (${ARCH} == "i386")
EXTRA_FILES=	vid_cvid_2.1_freebsdELFx86.tgz \
		vid_cyuv_1.0_freebsdELFx86.tgz \
		vid_h261_1.0_freebsdELFx86.tgz \
		vid_h263_1.0_freebsdELFx86.tgz \
		vid_iv32_2.1_freebsdELFx86.tgz \
		vid_iv41_1.1_freebsdELFx86.tgz \
		vid_iv50_1.0_freebsdELFx86.tgz
PLIST_FILES+=	lib/X11/xanim/cvid.readme lib/X11/xanim/cyuv.readme \
		lib/X11/xanim/h261.readme lib/X11/xanim/h263.readme \
		lib/X11/xanim/iv32.readme lib/X11/xanim/iv41.readme \
		lib/X11/xanim/iv50.readme \
		lib/X11/xanim/vid_cvid_2.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_cyuv_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_h261_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_h263_1.0_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv32_2.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv41_1.1_freebsdELFx86.xa \
		lib/X11/xanim/vid_iv50_1.0_freebsdELFx86.xa
PLIST_DIRS+=	lib/X11/xanim

post-install:
	@${MKDIR} ${DLLDIR}
	${INSTALL_DATA} ${WRKDIR}/*.readme ${DLLDIR}
	${INSTALL_DATA} ${WRKDIR}/*.xa ${DLLDIR}
.endif

.include <bsd.port.post.mk>
