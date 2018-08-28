#
# $MidnightBSD$ 
#
# Use of 'USE_OPENSSL=yes' includes this Makefile after bsd.ports.pre.mk
#
# the user/port can now set this options in the makefiles.
#
# WITH_OPENSSL_BASE=yes	- Use the version in the base system.
# WITH_OPENSSL_PORT=yes	- Use the port, even if base is up to date
# WITH_OPENSSL_HACK7=yes - Use not the version in the base system on 0.3
#
# USE_OPENSSL_RPATH=yes	- Pass RFLAGS options in CFLAGS,
#			  needed for ports who don't use LDFLAGS
#
# Overrideable defaults:
#
# OPENSSL_SHLIBVER=	3
# OPENSSL_PORT=		security/openssl
#
# The makefile sets this variables:
# OPENSSLBASE		- "/usr" or ${LOCALBASE}
# OPENSSLDIR		- path to openssl
# OPENSSLLIB		- path to the libs
# OPENSSLINC		- path to the matching includes
# OPENSSLRPATH		- rpath for dynamic linker
#
# MAKE_ENV		- extended with the variables above
# CONFIGURE_ENV		- extended with LDFLAGS
# BUILD_DEPENDS		- are added if needed
# RUN_DEPENDS		- are added if needed

.if !defined(_POSTMKINCLUDED) && !defined(Openssl_Pre_Include)

Openssl_Pre_Include=		openssl.mk
Openssl_Include_MAINTAINER=	ports@MidnightBSD.org

# honor obsolete options for a bit
.if defined(USE_OPENSSL_BASE) && !defined(WITH_OPENSSL_BASE)
WITH_OPENSSL_BASE=yes
.endif
.if defined(USE_OPENSSL_PORT) && !defined(WITH_OPENSSL_PORT)
WITH_OPENSSL_PORT=yes
.endif

.if defined(WITH_OPENSSL_HACK7)
.if ${OSVERSION} < 4015
# the openssl in base of MidnightBSD 0.3 is too old
WITH_OPENSSL_PORT?=	yes
.endif
.endif

#	if no preference was set, check for an installed base version
#	but give an installed port preference over it.
.if	!defined(WITH_OPENSSL_BASE) && \
	!defined(WITH_OPENSSL_PORT) && \
	!exists(${LOCALBASE}/lib/libcrypto.so) && \
	exists(/usr/include/openssl/opensslv.h)
WITH_OPENSSL_BASE=yes
.endif

.if defined(WITH_OPENSSL_BASE)
OPENSSLBASE=		/usr
OPENSSLDIR=		/etc/ssl

.if !exists(/usr/lib/libcrypto.so)
check-depends::
	@${ECHO_CMD} "Dependency error: this port requires the OpenSSL library, which is part of"
	@${ECHO_CMD} "the MidnightBSD crypto distribution but not installed on your"
	@${ECHO_CMD} "machine."
	@${FALSE}
.endif
.if exists(${LOCALBASE}/lib/libcrypto.so)
check-depends::
	@${ECHO_CMD} "Dependency error: this port wants the OpenSSL library from the BSD"
	@${ECHO_CMD} "base system. You can't build against it, while a newer"
	@${ECHO_CMD} "version is installed by a port."
	@${ECHO_CMD} "Please deinstall the port or undefine WITH_OPENSSL_BASE."
	@${FALSE}
.endif

# OpenSSL in the base system may not include IDEA for patent licensing reasons.
.if defined(MAKE_IDEA) && !defined(OPENSSL_IDEA)
OPENSSL_IDEA=		${MAKE_IDEA}
.else
OPENSSL_IDEA?=		NO
.endif

.if ${OPENSSL_IDEA} == "NO"
# XXX This is a hack to work around the fact that /etc/make.conf clobbers
#     our CFLAGS. It might not be enough for all future ports.
.if defined(HAS_CONFIGURE)
CFLAGS+=		-DNO_IDEA
.else
OPENSSL_CFLAGS+=	-DNO_IDEA
.endif
MAKE_ARGS+=		OPENSSL_CFLAGS="${OPENSSL_CFLAGS}"
.endif
OPENSSLRPATH=		/usr/lib:${LOCALBASE}/lib

.else

OPENSSLBASE=		${LOCALBASE}
OPENSSL_PORT?=		security/openssl
OPENSSL_SHLIBVER?=	8

OPENSSLDIR=		${OPENSSLBASE}/openssl
BUILD_DEPENDS+=		${LOCALBASE}/lib/libcrypto.so.${OPENSSL_SHLIBVER}:${PORTSDIR}/${OPENSSL_PORT}
RUN_DEPENDS+=		${LOCALBASE}/lib/libcrypto.so.${OPENSSL_SHLIBVER}:${PORTSDIR}/${OPENSSL_PORT}
OPENSSLRPATH=		${LOCALBASE}/lib

.endif

OPENSSLLIB=		${OPENSSLBASE}/lib
OPENSSLINC=		${OPENSSLBASE}/include

.if defined(USE_OPENSSL_RPATH)
CFLAGS+=		-Wl,-rpath,${OPENSSLRPATH}
.endif
OPENSSL_LDFLAGS+=	-Wl,-rpath=${OPENSSLRPATH}

LDFLAGS+=${OPENSSL_LDFLAGS}

MAKE_ENV+=		OPENSSLLIB=${OPENSSLLIB} OPENSSLINC=${OPENSSLINC} \
			OPENSSLBASE=${OPENSSLBASE} OPENSSLDIR=${OPENSSLDIR}

.endif # !defined(_POSTMKINCLUDED) && !defined(Openssl_Pre_Include)
