# Copyright (c) 2014-2018 LG Electronics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

TEMPLATE = app
TARGET = boosterd

QT += network
CONFIG += c++11
CONFIG -= app_bundle

CONFIG += webos webos-service
WEBOS_SYSBUS_DIR = $$PWD/../../sysbus

SOURCES += \
    abstractlunaservice.cpp \
    ipcserver.cpp \
    launchmanager.cpp \
    lunaservice.cpp \
    main.cpp

HEADERS += \
    abstractlunaservice.h \
    ipcserver.h \
    launchmanager.h \
    logger.h \
    lunaservice.h

OTHER_FILES += \
    booster.upstart \
    ../../service/com.webos.booster.json.prv \
    ../../service/com.webos.booster.json.pub \
    ../../service/com.webos.booster.service.prv \
    ../../service/com.webos.booster.service.pub

no_webos_platform {
    SOURCES += logger_default.cpp
} else {
    CONFIG += link_pkgconfig
    PKGCONFIG += PmLogLib glib-2.0 luna-service2
    SOURCES += logger_pmlog.cpp
}

target.path = $$WEBOS_INSTALL_BINS

INSTALLS += target
