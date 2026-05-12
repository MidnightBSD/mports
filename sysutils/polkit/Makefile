PORTNAME=	polkit
DISTVERSION=	127
CATEGORIES=	sysutils gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework for controlling access to system-wide components
WWW=		https://github.com/${GH_ACCOUNT}/${GH_PROJECT}

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexpat.so:textproc/expat2 \
		libdbus-1.so:devel/dbus \
		libduktape.so:lang/duktape-lib

USERS=		polkitd
GROUPS=		polkitd

USES=		compiler:c++17-lang cpe gettext-tools gnome \
		localbase meson pathfix perl5 pkgconfig python:test shebangfix
USE_GNOME=	glib20 introspection:build
SHEBANG_FILES=	src/polkitbackend/toarray.pl \
		test/wrapper.py
USE_LDCONFIG=	yes
USE_PERL5=	build
CPE_VENDOR=	polkit_project

USE_GITHUB=	yes
GH_ACCOUNT=	polkit-org

MESON_ARGS=	-Dpam_include=system \
		-Dpam_prefix='etc/pam.d' \
		-Dpolkitd_user=${USERS} \
		-Dexamples=false \
		-Dsession_tracking=ConsoleKit \
		-Dtests=false \
		-Dintrospection=true \
		-Dgtk_doc=false \
		-Dgettext=true

OPTIONS_DEFINE=		MANPAGES

OPTIONS_SUB=		yes

MANPAGES_BUILD_DEPENDS=	docbook-sgml>0:textproc/docbook-sgml \
			docbook-xsl>0:textproc/docbook-xsl
MANPAGES_USE=		gnome=libxslt:build
MANPAGES_MESON_TRUE=	man

.ifdef ALLOW_SYSTEM_AFFECTING_TESTS
TEST_ENV+=		ALLOW_SYSTEM_AFFECTING_TESTS=1
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/bin/|${PREFIX}/bin/|g' \
		${WRKSRC}/docs/man/pkexec.xml \
		${WRKSRC}/src/examples/org.freedesktop.policykit.examples.pkexec.policy.in
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${PREFIX}|g' \
		${WRKSRC}/docs/man/polkit.xml

post-install:
	@${MKDIR} ${FAKE_DESTDIR}/var/lib/polkit-1 \
		  ${PREFIX}/share/polkit-1/rules.d
.for i in 10-vendor.d 20-org.d 30-site.d 50-local.d 90-mandatory.d
	${MKDIR} ${PREFIX}/etc/polkit-1/localauthority/${i}
	${MKDIR} ${FAKE_DESTDIR}/var/lib/polkit-1/localauthority/${i}
.endfor

.include <bsd.port.post.mk>
