PORTNAME=	gerbv
DISTVERSIONPREFIX=v
DISTVERSION=	2.10.0
CATEGORIES=	cad
MASTER_SITES=	GH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gerber file viewer
WWW=		https://gerbv.github.io/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

USES=		autoreconf compiler:c++11-lang cpe desktop-file-utils \
		gmake gnome libtool localbase pkgconfig
USE_GITHUB=	yes
USE_GNOME=	cairo gtk20
USE_LDCONFIG=	yes

CPE_VENDOR=	gerbv_project

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ENV=	ac_aux_dir="."
CFLAGS+=	-fcommon
INSTALL_TARGET=	install-strip

PLIST_SUB=	VERSION="${PORTVERSION}"

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
	@${REINPLACE_CMD} -e \
		's|^AM_NLS|#AM_NLS| ; \
		 s|^AM_GNU_GETTEXT|#AM_GNU_GETTEXT| ; \
		 /intl\/Makefile/d ; \
		 /po\/Makefile/d' ${WRKSRC}/configure.ac
	@${REINPLACE_CMD} -e \
		'/^SUBDIRS/s|=.*|= src man scheme|' ${WRKSRC}/Makefile.am
	@${REINPLACE_CMD} -e \
		'/^man_MANS/s|gerbv.ru.1|| ; \
		 s|^PO_|#PO_|' ${WRKSRC}/man/Makefile.am
	@${REINPLACE_CMD} -e \
		'/^pkgconfigdir/s|$$(libdir)|$$(prefix)/libdata|' \
		${WRKSRC}/src/Makefile.am

post-install:
	(cd ${WRKSRC}/desktop && ${INSTALL_DATA} gerbv.desktop \
		${DESKTOPDIR})
	@${MKDIR} ${PREFIX}/share/icons/hicolor/scalable/apps
	(cd ${WRKSRC}/desktop && ${INSTALL_DATA} gerbv.svg \
		${PREFIX}/share/icons/hicolor/scalable/apps)
.for i in 16 22 24 32 48
	@${MKDIR} ${PREFIX}/share/icons/hicolor/${i}x${i}/apps
	(cd ${WRKSRC}/desktop && ${INSTALL_DATA} gerbv-${i}.png \
		${PREFIX}/share/icons/hicolor/${i}x${i}/apps/gerbv.png)
.endfor

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc && ${INSTALL_DATA} *.fig *.txt \
		${FAKE_DESTDIR}${DOCSDIR})
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/PNG-print
	(cd ${WRKSRC}/doc/PNG-print && ${INSTALL_DATA} *.jpg *.txt \
		${FAKE_DESTDIR}${DOCSDIR}/PNG-print)
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/eagle
	(cd ${WRKSRC}/doc/eagle && ${INSTALL_DATA} *.pl *.txt \
		${FAKE_DESTDIR}${DOCSDIR}/eagle)

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/example && ${FIND} . \
		! \( -name "*Makefile*" -or -name ".cvsignore" \) \
		| ${CPIO} --quiet -pdm -L -R ${SHAREOWN}:${SHAREGRP} \
		${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
