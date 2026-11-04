PORTNAME=	gerbv
DISTVERSIONPREFIX=v
DISTVERSION=	2.13.0
CATEGORIES=	cad
MASTER_SITES=	GH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gerber file viewer
WWW=		https://gerbv.github.io/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2

BUILD_DEPENDS=	bash:shells/bash

USES=		cmake compiler:c++11-lang cpe desktop-file-utils gettext \
		gnome libtool localbase pkgconfig
USE_GITHUB=	yes
USE_GNOME=	cairo gtk-update-icon-cache gtk20
USE_LDCONFIG=	yes

CPE_VENDOR=	gerbv_project

CONFIGURE_ENV=	ac_aux_dir="."
CFLAGS+=	-fcommon
INSTALLS_ICONS=	yes

PLIST_SUB=	VERSION="${PORTVERSION}"

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch-DOCS-off:
	@${REINPLACE_CMD} -e '/^install(DIRECTORY example TYPE DOC)/d' \
		${WRKSRC}/CMakeLists.txt

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
