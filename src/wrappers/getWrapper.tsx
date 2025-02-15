import { NativeModule, Platform } from 'react-native';
import {
  ADDRESS_COMPONENTS,
  find,
  NATIVE_COMPONENTS,
  UNSUPPORTED_PAYMENT_METHODS,
} from '../ComponentMap';
import {
  UNKNOWN_PAYMENT_METHOD_ERROR,
  UNSUPPORTED_PAYMENT_METHOD_ERROR,
} from '../core/constants';
import { PaymentMethod, PaymentMethodsResponse } from '../core/types';
import { ActionHandlingComponentWrapper } from './ActionHandlingComponentWrapper';
import { AdyenActionComponent } from '../core/AdyenNativeModules';
import { AdyenDropIn } from '../modules/DropInModule';
import { AdyenInstant } from '../modules/AdyenInstant';
import { AdyenApplePay } from '../modules/AdyenApplePay';
import { AdyenGooglePay } from '../modules/AdyenGooglePay';
import { DropInComponentWrapper } from './DropInComponentWrapper';

/**
 * Get native component capable of handling provided payment method type.
 */
export function getWrapper(
  typeName: string,
  paymentMethods: PaymentMethodsResponse
): {
  nativeComponent: AdyenActionComponent & NativeModule;
  paymentMethod?: PaymentMethod;
} {
  switch (typeName) {
    case 'dropin':
    case 'dropIn':
    case 'drop-in':
    case 'adyendropin':
      return {
        nativeComponent: new DropInComponentWrapper({
          nativeModule: AdyenDropIn,
        }),
      };
    case 'applepay':
      return {
        nativeComponent: new ActionHandlingComponentWrapper({
          nativeModule: AdyenApplePay,
        }),
      };
    case 'paywithgoogle':
    case 'googlepay':
      return {
        nativeComponent: new ActionHandlingComponentWrapper({
          nativeModule: AdyenGooglePay,
        }),
      };
    default:
      break;
  }

  const paymentMethod = find(paymentMethods, typeName);
  if (!paymentMethod) {
    throw new Error(UNKNOWN_PAYMENT_METHOD_ERROR + typeName);
  }

  if (UNSUPPORTED_PAYMENT_METHODS.includes(typeName)) {
    throw new Error(UNSUPPORTED_PAYMENT_METHOD_ERROR + typeName);
  }

  let nativeComponent: AdyenActionComponent & NativeModule;
  if (ADDRESS_COMPONENTS.includes(typeName)) {
    nativeComponent = new DropInComponentWrapper({
      nativeModule: AdyenDropIn,
    });
  } else {
    // New iDEAL not treated as INSTANT on Android
    var extendedComponentList = NATIVE_COMPONENTS;
    if (Platform.OS === `android`) {
      extendedComponentList.push(`ideal`);
    }
    const nativeModule = extendedComponentList.includes(typeName)
      ? AdyenDropIn
      : AdyenInstant;
    nativeComponent = new ActionHandlingComponentWrapper({
      nativeModule: nativeModule,
    });
  }

  return {
    nativeComponent: nativeComponent,
    paymentMethod: paymentMethod,
  };
}
