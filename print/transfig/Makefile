PORTNAME=	transfig
PORTVERSION=	3.2.5e
PORTREVISION=	5
CATEGORIES=	print
MASTER_SITES=	SF/mcj/mcj-source/
DISTNAME=	${PORTNAME}.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools to convert Xfig .fig files

LICENSE=	transfig
LICENSE_NAME=	Transfig License
LICENSE_FILE=	${FILESDIR}/LICENSE
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

RUN_DEPENDS=	ppmtogif:graphics/netpbm
LIB_DEPENDS=	libpng.so:graphics/png

USES=		ghostscript:run imake xorg
CFLAGS+=	-Wno-return-type
USE_XORG=	xpm

CONFLICTS_INSTALL=	fig2dev

MAKE_ARGS+=	INSTALLFLAGS="${COPY}" \
		INSTPGMFLAGS="${STRIP}" \
		INSTBINFLAGS="-m ${BINMODE}" \
		INSTDATFLAGS="-m ${SHAREMODE}" \
		INSTMANFLAGS="-m ${MANMODE}" \
		MANPATH=${PREFIX}/share/man

post-install:
	for i in hr_HR hu_HU pl_PL ro_RO; do \
		${LN} -sf cs_CZ.ps ${STAGEDIR}${PREFIX}/lib/X11/fig2dev/$${i}.ps; \
	done
	for i in ja ja_JP.EUC ja_JP.eucJP ja_JP ja_JP.ujis ; do \
		${LN} -sf japanese.ps ${STAGEDIR}${PREFIX}/lib/X11/fig2dev/$${i}.ps; \
	done
	for i in ko ko_KR.EUC ko_KR.eucKR ko_KR ko_KR.ujis; do \
		${LN} -sf korean.ps ${STAGEDIR}${PREFIX}/lib/X11/fig2dev/$${i}.ps; \
	done

.include <bsd.port.mk>
