PORTNAME=	scdoc
DISTVERSION=	1.11.1
CATEGORIES=	textproc
MASTER_SITES=	https://git.sr.ht/~sircmpwn/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small man page generator

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USES=		gmake
MAKE_ENV=	PCDIR='$$(_INSTDIR)/libdata/pkgconfig'
TEST_TARGET=	check
PLIST_FILES=	bin/${PORTNAME} \
		libdata/pkgconfig/${PORTNAME}.pc \
		share/man/man1/${PORTNAME}.1.gz \
		share/man/man5/${PORTNAME}.5.gz

post-patch:
	@${REINPLACE_CMD} '/-static/d' ${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
