PORTNAME=	mdbtools
PORTVERSION=	0.7.1
PORTREVISION=	1
CATEGORIES=	databases

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities and libraries to export data from MS Access databases (.mdb)

LICENSE=	gpl2

BUILD_DEPENDS=	gawk:lang/gawk \
		txt2man:textproc/txt2man
LIB_DEPENDS=	libodbc.so:databases/unixODBC

OPTIONS_DEFINE=	GNOME DOCS
OPTIONS_SUB=	yes

USES=		autoreconf bison gettext-runtime gnome iconv libtool pathfix pkgconfig readline
USE_GITHUB=	yes
GH_ACCOUNT=	brianb
USE_LDCONFIG=	yes
USE_GNOME=	glib20
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	${ICONV_CONFIGURE_ARG} \
		--with-unixodbc=${LOCALBASE}
INSTALL_TARGET=	install-strip

DOCS=		AUTHORS ChangeLog HACKING NEWS README TODO

GNOME_CONFIGURE_ENABLE=	gmdb2
GNOME_USE=	GNOME=gnomeprefix GNOME=libgnomeui GNOME=gconf2 GNOME=intltool

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS:S,^,${WRKSRC}/,}  ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
