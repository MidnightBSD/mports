# $MidnightBSD: mports/devel/py-dbus/Makefile,v 1.4 2011/02/02 20:17:34 laffer1 Exp $
# $FreeBSD: ports/devel/py-dbus/Makefile,v 1.22 2007/03/20 22:11:54 pav Exp $

PORTNAME=	dbus
PORTVERSION=	0.83.2
CATEGORIES=	devel gnome python
MASTER_SITES=	http://dbus.freedesktop.org/releases/dbus-python/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}-python-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for the D-BUS messaging system
LICENSE=	gpl2

LIB_DEPENDS=	dbus-glib-1.2:${PORTSDIR}/devel/dbus-glib

USE_GETTEXT=	yes
USE_GNOME=	gnomehack gnometarget
USE_PYTHON=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=	libtool
CONFIGURE_ENV=	CPPFLAGS="-I${PYTHON_INCLUDEDIR}"
CONFIGURE_ARGS=	--docdir=${DOCSDIR} \
		--disable-api-docs

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/bin/rst2html) && !defined(NOPORTDOCS)
PLIST_SUB+=	HTML=""
.else
CONFIGURE_ARGS+=--disable-html-docs
PLIST_SUB+=	HTML="@comment "
.endif

post-patch:
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|HEADERS install-dist_docDATA|HEADERS|g ; \
		s|PYTHON install-nodist_docDATA|PYTHON|g' \
			${WRKSRC}/Makefile.in
.endif

post-install:
.if !defined(NOPORTEXAMPLES)
	${MKDIR} ${EXAMPLESDIR} && \
		${INSTALL_DATA} ${WRKSRC}/examples/*.py ${EXAMPLESDIR}
.endif

.include <bsd.port.post.mk>
