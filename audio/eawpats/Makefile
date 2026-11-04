PORTNAME=	eawpats
DISTVERSION=	12
PORTREVISION=	4
CATEGORIES=	audio
MASTER_SITES=	FREEBSD_LOCAL/fuz
DISTNAME=	eawpats12_full

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Eric A. Welsh's collection of Gravis Ultrasound MIDI patches

# Converted from RESTRICTED
LICENSE=	EAWPATS
LICENSE_NAME=	eawpats
LICENSE_TEXT=	Some of the patches are marked no-commercial-use
LICENSE_PERMS=	auto-accept

NO_BUILD=	yes
NO_ARCH=	yes
SUB_FILES=	pkg-message

PATCH_SUBDIRS=	ethnic mazpat/fx gsdrum08 gsdrum25 gsdrum40 gus power sfx wime
DOC_SUBDIRS=	ethnic gsdrum08 gsdrum25 gsdrum40 power wime

WRKSRC=		${WRKDIR}/${PORTNAME}
TIMIDITY_DATADIR=	${PREFIX}/share/timidity

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|/home/user/eawpats|${DATADIR}|' ${WRKSRC}/linuxconfig/timidity.cfg

do-install:
	${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/*.cfg ${WRKSRC}/*.pat ${WRKSRC}/*.ini ${DATADIR}
.for subdir in ${PATCH_SUBDIRS}
	${MKDIR} ${DATADIR}/${subdir}
	${INSTALL_DATA} ${WRKSRC}/${subdir}/*.pat ${DATADIR}/${subdir}
.endfor
	${MKDIR} ${TIMIDITY_DATADIR}
	${INSTALL_DATA} ${WRKSRC}/linuxconfig/timidity.cfg ${TIMIDITY_DATADIR}/timidity.cfg-eawpats
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/*.txt ${WRKSRC}/*.hlp ${DOCSDIR}
.for subdir in ${DOC_SUBDIRS}
	${MKDIR} ${DOCSDIR}/${subdir}
	${INSTALL_DATA} ${WRKSRC}/${subdir}/*.txt ${DOCSDIR}/${subdir}
.endfor

.include <bsd.port.mk>
