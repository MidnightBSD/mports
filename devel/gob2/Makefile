PORTNAME=	gob2
PORTVERSION=	2.0.18
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Preprocessor for making GObjects with inline C
WWW=		https://www.5z.com/jirka/gob.html

LICENSE=	gpl2

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
USE_GNOME=	glib20
USES=		gmake gnome localbase pkgconfig

PLIST_FILES=	bin/gob2 share/aclocal/gob2.m4 ${EXAMPLES:S/^/%%EXAMPLESDIR%%\//} \
		share/man/man1/gob2.1.gz

EXAMPLES=	GNOME_Foo_SomeInterface.idl \
		README \
		foo-some-interface.gob \
		gtk-button-count.gob \
		my-glade-main.c \
		my-glade.glade \
		my-glade.gob \
		my-person.gob

post-install:
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
.for f in ${EXAMPLES}
	${INSTALL_DATA} ${WRKSRC}/examples/${f} ${STAGEDIR}${EXAMPLESDIR}
.endfor

.include <bsd.port.mk>
