# $MidnightBSD: mports/security/gnome-keyring/Makefile,v 1.10 2011/02/02 21:20:53 laffer1 Exp $

PORTNAME=	gnome-keyring
PORTVERSION=	2.32.1
CATEGORIES=	security gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A program that keeps passwords and other secrets
LICENSE=	gpl2

LIB_DEPENDS=	gnome-keyring.0:${PORTSDIR}/security/libgnome-keyring
RUN_DEPENDS=	${LOCALBASE}/share/certs/ca-root-nss.crt:${PORTSDIR}/security/ca_root_nss

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnomeprefix gtk20 ltverhack intlhack
USE_GMAKE=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-pam-dir="${PREFIX}/lib" \
		--with-root-certs="${LOCALBASE}/share/certs/ca-root-nss.crt"
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
GLIB_SCHEMAS=	org.gnome.crypto.cache.gschema.xml \
		org.gnome.crypto.pgp.gschema.xml

pre-fake:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/dbus-1/services/

.include <bsd.port.mk>
