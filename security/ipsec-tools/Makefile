PORTNAME=	ipsec-tools
PORTVERSION=	0.8.2
PORTREVISION=	1
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KAME racoon IKE daemon, ipsec-tools version
WWW=		https://ipsec-tools.sourceforge.net/

LICENSE=	bsd3

CONFLICTS=	racoon-[0-9]*

USE_RC_SUBR=	racoon

INSTALL_TARGET=	install-strip

USES=		cpe libtool tar:bzip2 ssl
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-shared --sysconfdir=${PREFIX}/etc/racoon \
		--localstatedir=${STATEDIR:S/\/racoon//} \
		--with-pkgversion=midnightbsd-${PORTVERSION}

STATEDIR=	/var/db/racoon
SUB_LIST+=	STATEDIR=${STATEDIR} REQUIREMOD=${REQUIREMOD}
PLIST_SUB+=	STATEDIR=${STATEDIR}

OPTIONS_DEFINE=	IPV6 ADMINPORT STATS DPD NATT NATTF FRAG HYBRID PAM \
		RADIUS LDAP GSSAPI SAUNSPEC RC5 IDEA DOCS EXAMPLES WCPSKEY
OPTIONS_DEFAULT=	DPD NATT FRAG HYBRID

ADMINPORT_DESC=	Enable Admin port
STATS_DESC=	Statistics logging function
DPD_DESC=	Dead Peer Detection
NATT_DESC=	NAT-Traversal (kernel-patch required)
FRAG_DESC=	IKE fragmentation payload support
HYBRID_DESC=	Hybrid, Xauth and Mode-cfg support
SAUNSPEC_DESC=	Unspecified SA mode
RC5_DESC=	RC5 encryption (patented)
IDEA_DESC=	IDEA encryption (patented)
PAM_DESC=	PAM authentication (Xauth server)
RADIUS_DESC=	Radius authentication (Xauth server)
LDAP_DESC=	LDAP authentication (Xauth server)
WCPSKEY_DESC=	Allow wildcard matching for pre-shared keys

PORTDOCS=	*
PORTEXAMPLES=	*

IPV6_CONFIGURE_ENABLE=	ipv6
ADMINPORT_CONFIGURE_ENABLE=adminport
STATS_CONFIGURE_ENABLE=	stats
DPD_CONFIGURE_ENABLE=	dpd
NATT_CONFIGURE_ON=	--enable-natt=yes --enable-natt-versions=rfc
NATT_CONFIGURE_OFF=	--disable-natt
FRAG_CONFIGURE_ENABLE=	frag
HYBRID_CONFIGURE_ENABLE=hybrid
PAM_CONFIGURE_WITH=	libpam
GSSAPI_USES=		iconv
GSSAPI_CFLAGS=		-I${LOCALBASE}/include
GSSAPI_LDFLAGS=		-L${LOCALBASE}/lib
GSSAPI_CONFIGURE_ENABLE=gssapi
RADIUS_CONFIGURE_WITH=	libradius
LDAP_USES=		ldap
LDAP_CONFIGURE_ON=	--with-libldap=${LOCALBASE}
LDAP_CONFIGURE_OFF=	--without-libldap
SAUNSPEC_CONFIGURE_ENABLE=	samode-unspec
RC5_CONFIGURE_ENABLE=		rc5
IDEA_CONFIGURE_ENABLE=		idea
NATT_EXTRA_PATCHES=		${FILESDIR}/natt.diff
WCPSKEY_EXTRA_PATCHES=	${FILESDIR}/wildcard-psk.diff ${FILESDIR}/wildcard-psk-oakley.c.diff

.include <bsd.port.pre.mk>

REQUIREMOD?=	ipsec

post-patch:
	@${REINPLACE_CMD} -e "s/-Werror//g ; s/-R$$libdir/-Wl,-rpath=$$libdir/g" ${WRKSRC}/configure

post-install:
	@${MKDIR} ${PREFIX}/etc/racoon
	@if [ -z `/sbin/sysctl -a | ${GREP} -q ipsec && ${ECHO_CMD} ipsec` ]; then \
	    ${ECHO_MSG} "WARNING: IPsec feature is disabled on this host"; \
	    ${ECHO_MSG} "         You must build the kernel if you want to run racoon on the host"; \
	fi ;
	@${MKDIR} ${EXAMPLESDIR}
	@${RM} -f ${WRKSRC}/src/racoon/samples/*.in
	@${CP} -r ${WRKSRC}/src/racoon/samples/* ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/src/racoon/doc/* ${DOCSDIR}

.  if ${SSL_DEFAULT} != openssl
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-ipsec-tools
PLIST_FILES+=	include/racoon/openssl_compat.h
.  endif

.include <bsd.port.post.mk>
