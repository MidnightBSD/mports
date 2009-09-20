# New ports collection makefile for:	evolution-data-server
#
# $MidnightBSD: mports/databases/evolution-data-server/Makefile,v 1.4 2008/06/23 02:02:42 laffer1 Exp $
#

PORTNAME=	evolution-data-server
PORTVERSION=	2.22.2
CATEGORIES=	databases gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The data backends for the Evolution integrated mail/PIM suite
LICENSE=	gpl2

LIB_DEPENDS=	soup-2.4.1:${PORTSDIR}/devel/libsoup \
		nss3.1:${PORTSDIR}/security/nss \
		tasn1.3:${PORTSDIR}/security/libtasn1

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_GETTEXT=	yes
USE_XORG=	x11
USE_GNOME=	gnomeprefix gnomehack intlhack gnometarget libgnomeui \
		ltverhack
USE_OPENLDAP=	yes
USE_AUTOTOOLS=	libtool:22
USE_BDB=	41+
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-static \
		--enable-nss=yes \
		--with-openldap=yes \
		--with-libdb=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include -I${BDB_INCLUDE_DIR} ${PTHREAD_CFLAGS}" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

PLIST_SUB=	VERSION="2.22" EVO_VERSION="1.2"

OPTIONS=	IMAP4	"Enable experimental IMAP4 backend" off

.include <bsd.port.pre.mk>

.if defined(HEIMDAL_HOME) || defined(WITH_HEIMDAL)
HEIMDAL_HOME?=	${LOCALBASE}
LIB_DEPENDS+=		krb5:${PORTSDIR}/security/heimdal
CONFIGURE_ARGS+=	--with-krb5=${HEIMDAL_HOME} --with-krb5-includes=${HEIMDAL_HOME}/include
KRB5_LIB=		`${HEIMDAL_HOME}/bin/krb5-config --libs`
.elif !defined(NO_KERBEROS)
CONFIGURE_ARGS+=        --with-krb5=/usr
KRB5_LIB=		`/usr/bin/krb5-config gssapi --libs`
.endif

.if defined(WITH_IMAP4) || defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=	--enable-imap4=yes
PLIST_SUB+=		IMAP4=""
.else
PLIST_SUB+=		IMAP4="@comment "
.endif

EDS_BDB_MSG=	"!!!WARNING!!!: Berkeley Database version is ${BDB_VER}.  If this is an upgrade, you may experience problems if you or any other Evolution-data-server users were previously using BDB_VER 41."

pre-everything::
	@if [ x"${BDB_VER}" != x"41" ]; then \
		${ECHO_MSG} ${EDS_BDB_MSG} | ${FMT} 75 79 ; \
	fi

post-patch:
	@${REINPLACE_CMD} -e 's|-ldb|-l${BDB_LIB_NAME}|g ; \
		s|heimlibs=".*"|heimlibs="${KRB5_LIB}"|g' \
			${WRKSRC}/configure

.include <bsd.port.post.mk>
