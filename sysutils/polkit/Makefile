# $MidnightBSD$

PORTNAME=	polkit
PORTVERSION=	0.105
PORTREVISION=	2
CATEGORIES=	sysutils gnome
MASTER_SITES=	http://www.freedesktop.org/software/polkit/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for controlling access to system-wide components

LICENSE=	lgpl

LIB_DEPENDS=	libexpat.so:${PORTSDIR}/textproc/expat2
RUN_DEPENDS=	dbus-launch:${PORTSDIR}/devel/dbus

USE_GNOME=	glib20 intlhack gnomehier introspection
GNU_CONFIGURE=	yes
USES=		gettext gmake libtool:keepla pathfix pkgconfig
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-gtk-doc \
		--with-authfw=pam \
		--with-pam-include=system \
		--with-os-type=freebsd \
		--disable-systemd \
		--enable-introspection \
		--localstatedir=/var
CONFIGURE_ENV=	GTKDOC="false"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
MAKE_JOBS_UNSAFE=yes

OPTIONS_DEFINE=	MANPAGES

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMANPAGES}
BUILD_DEPENDS+=	${LOCALBASE}/share/sgml/docbook/4.1/dtd/catalog:${PORTSDIR}/textproc/docbook-410 \
		${LOCALBASE}/share/xsl/docbook/manpages/docbook.xsl:${PORTSDIR}/textproc/docbook-xsl
USE_GNOME+=	libxslt:build
PLIST_SUB+=	MANPAGES=""
.else
PLIST_SUB+=	MANPAGES="@comment "
CONFIGURE_ARGS+=--disable-man-pages
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/|${PREFIX}/bin/|g' \
		${WRKSRC}/docs/man/pkexec.xml \
		${WRKSRC}/src/examples/org.freedesktop.policykit.examples.pkexec.policy.in

post-install:
	${MKDIR} ${PREFIX}/etc/dbus-1/system.d/
	if [ ! -f ${PREFIX}/etc/dbus-1/system.d/org.freedesktop.PolicyKit1.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/data/org.freedesktop.PolicyKit1.conf \
			${PREFIX}/etc/dbus-1/system.d/org.freedesktop.PolicyKit1.conf ; \
	fi
	${INSTALL_DATA} ${WRKSRC}/data/org.freedesktop.PolicyKit1.conf \
		${PREFIX}/etc/dbus-1/system.d/org.freedesktop.PolicyKit1.conf.dist
	@${STRIP_CMD} ${PREFIX}/lib/lib*.so*
	@${STRIP_CMD} ${PREFIX}/lib/polkit-1/extensions/lib*.so

.if !defined(PACKAGE_BUILDING)
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
.endif

.include <bsd.port.mk>
